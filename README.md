# AwsAccountNumber

You can get your Amazon Web Services (AWS) account number.

## Installation

```ruby
gem install aws_account_number
```

## Usage

```
# default by security group
$ aws_account_number

# by CloudFormation
$ aws_account_number cfn

# by IAM User (use current credentials)
$ aws_account_number iamuser

# use profile
$ aws_account_number --profile foo
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec aws_account_number` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aws_account_number/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
