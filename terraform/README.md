# Terraform - AWS S3 Bucket static web

A terraform project to provision AWS S3 buckets configured to serve static web content. The project also creates a IAM user with access to manage objects in the buckets.

## Prerequisites

* Terraform - installation [instructions](https://www.terraform.io/downloads.html)
* AWS user with access to manage S3 buckets and IAM users.

The AWS API Key ID and Secret can be set by:

* Using environment variables
  * `export AWS_ACCESS_KEY_ID=your_access_key_id`
  * `export AWS_SECRET_ACCESS_KEY=your_secret_key`
* Creating a default AWS shared credentials file - `~/.aws/credentials`

## Running the project

The created infrastructure can be configured by setting the terraform variables in `variables.tf`. Read each variable's description to see what setting it does. How to set variable values in terraform is described [here](https://www.terraform.io/docs/configuration/variables.html#assigning-values-to-root-module-variables).

* Manage infrastructure with Terraform:
  * `terraform plan` - shows what resources will be created/modified/destroyed
  * `terraform apply` - applies the planned changes
  * `terraform destroy` - destroys all created resources

## Using KitchenCI to test

The project includes a KitchenCI configuration that can be used to test the terraform configuration.

### It is recommended to use rbenv or another Ruby versions manager. To set `rbenv` on MAC:

* Install rbenv - run `brew install rbenv`
* Initialize rbenv - add to `~/.bash_profile` line `eval "$(rbenv init -)"`
* Run `source ~/.bash_profile`
* Install ruby 2.3.1 with rbenv - run `rbenv install 2.3.1` , check `rbenv versions`
* Set ruby version for the project to 2.3.1 - run `rbenv local 2.3.1` , check `rbenv local`

### Install Ruby gems from Gemfile

* Install bundler - run `gem install bundler`
* Refresh rbenv - run `rbenv rehash`
* Install gems from Gemfile - run `bundle install`

### Other prerequisites

Some of the tests rely on the aws CLI so it needs to be installed on the system - installation [instructions](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html#install-tool-bundled).

### Run Kitchen-CI tests

The terraform variables used for the test are set in the file `test.tfvars` and can be modified there when needed.

* Build kitchen environment - `bundle exec kitchen converge`
* Run kitchen tests - `bundle exec kitchen verify`
* Destroy kitchen environment - `bundle exec kitchen destroy`
