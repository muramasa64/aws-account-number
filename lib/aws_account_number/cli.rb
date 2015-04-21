# code: utf-8

require 'thor'
require 'thor/aws'

module AwsAccountNumber
  class CLI < Thor
    include Thor::Aws

    default_command :security_group

    desc :security_group, "get AWS Account Number from security group", alias: :s
    def security_group
      begin
        puts ec2.client.describe_security_groups(group_names: ['default']).security_groups.first.owner_id
      rescue RuntimeError => e
        $stderr.puts e
        exit 1
      end
    end

    desc :cfn, "get AWS Account Number from CloudFormation stack", alias: :f
    def cfn
      template = <<-EOT
      {
        "Resources":{
          "WaitHandle":{
            "Type":"AWS::CloudFormation::WaitConditionHandle"
          },
          "Wait":{
            "Type":"AWS::CloudFormation::WaitCondition",
            "Properties":{
              "Handle":{ "Ref":"WaitHandle" },
              "Timeout":"1"
            }
          }
        }
      }
      EOT
      begin
        result = cloudformation.client.create_stack(
          stack_name: "accountnumber#{Time.now.to_i}",
          template_body: template,
          on_failure: "DELETE"
        )
        puts result.stack_id.split(':')[4]
      rescue RuntimeError => e
        $stderr.puts e
        exit 1
      end
    end
  end
end
