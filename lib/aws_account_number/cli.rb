# code: utf-8

require 'thor'
require 'thor/aws'

module AwsAccountNumber
  class CLI < Thor
    include Thor::Aws

    desc :get, "get AWS Account Number"
    def get
      begin
        puts ec2.client.describe_security_groups(group_names: ['default']).security_groups.first.owner_id
      rescue RuntimeError => e
        $stderr.puts e
      end
    end
  end
end
