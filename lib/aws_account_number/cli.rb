# code: utf-8

require 'thor'
require 'thor/aws'

module AwsAccountNumber
  class CLI < Thor
    include Thor::Aws

    desc :get, "get AWS Account Number"
    def get
      puts ec2.client.describe_security_groups(group_names: ['default']).security_groups.first.owner_id
    end
  end
end
