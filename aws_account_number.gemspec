# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_account_number/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_account_number"
  spec.version       = AwsAccountNumber::VERSION
  spec.authors       = ["ISOBE Kazuhiko"]
  spec.email         = ["muramasa64@gmail.com"]

  spec.summary       = %q{Get AWS Account Number}
  spec.description   = %q{You can get AWS Account Number by AWS API}
  spec.homepage      = "http://github.com/muramasa64/aws-account-number"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "aws-sdk"
  spec.add_dependency "thor-aws"
end
