control 'aws_tests_bucket' do

    title 'Test S3 buckets'

    buckets = attribute('s3-bucket-names')
    buckets.each do |bucket|
        
        describe aws_s3_bucket(bucket) do
            it { should exist }
            its('bucket_policy') { should_not be_empty }
        end

    end

end

control 'aws_tests_deploy_user' do
    
    title 'Test deploy user'

    describe aws_iam_user(attribute('iam-user-name')) do
        it { should exist }
        it { should_not have_console_password }
        its('inline_policy_names.count') { should eq 1 }
      end

      describe aws_iam_access_key(username: attribute('iam-user-name'), access_key_id: attribute('iam-user-access-key-id')) do
        it { should exist }
        it { should be_active }
      end
      
end
