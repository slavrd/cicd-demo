# Basic CI/CD pipeline demo

[![Build Status](https://travis-ci.org/slavrd/cicd-demo.svg?branch=master)](https://travis-ci.org/slavrd/cicd-demo)
![GitHub release](https://img.shields.io/github/release/slavrd/cicd-demo.svg)

A simple CI/CD pipeline demonstration.

The pipeline is used to manage static html website served using AWS S3 bucket. It is built using Travis-CI.

## Workflow

The infrastructure consists of a GitHub repository, containing the code, a S3 bucket used as staging environment and another S3 bucket for production.

The pipeline is built to follow the workflow below:

1. Changes to the code are proposed via pull requests to the master branch. When a request is opened a Travis CI build is triggered to run automated tests. If the tests are passed the request can be merged.
2. When a pull request is merged with the master branch another Travis CI build is triggered. It deploys the code to the staging S3 bucket. This way the staging environment is always running with current code.
3. The code is released to production by creating a Github release. When a release is created a Travis CI build is triggered which deploys the code to the production S3 bucket.

## Running the project

1. Enable the GitHub repository on Travis CI - [help](https://docs.travis-ci.com/user/tutorial/)
2. AWS Setup:

    * S3 Buckets, configured to serve static html content - [help](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html)
    * A IAM user with access to the S3 buckets (example IAM [policy](https://docs.travis-ci.com/user/deployment/s3/#s3-acl-via-option)) and API keys

    In the `terraform` folder there is a Terraform project which will create the needed infrastructure in AWS

3. In `.travis.yml` set values for the following keys:

    * `deploy.access_key_id` - your AWS access key id ( [encrypted](https://docs.travis-ci.com/user/encryption-keys/#usage), using Travis [cli](https://github.com/travis-ci/travis.rb#readme) )
    * `deploy.secret_access_key` - your AWS secret access key ( [encrypted](https://docs.travis-ci.com/user/encryption-keys/#usage), using Travis [cli](https://github.com/travis-ci/travis.rb#readme) )
    * `deploy.region` - the AWS region containing each S3 bucket
    * `deploy.bucket` - the name of the S3 bucket
      * set staging bucket to the deploy provider where `on.tags: false` and `on.condition: "$TRAVIS_BRANCH =~ ^master$"`
      * set the production bucket to the deploy provider where `on.tags: true`
