control 'remote_tests' do

    title "Remote functionality tests"

    attribute('s3-bucket-names').each do |bucket|

        describe command('AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s aws s3 cp test/integration/default/files/index.html s3://%s' \
            % [attribute('iam-user-access-key-id'), attribute('iam-user-secret-key-plain'), bucket],
            redact_regex: /(AWS_SECRET_ACCESS_KEY=)\S*/) do
            
            its('exit_status') { should eq 0 }
            its('stdout') { should match 'upload:'}
            its('stderr') { should match "" }

        end

    end

    attribute('website-endpoints').each do |website|
        
        describe http("http://#{website}") do

            its('status') { should eq 200 }
            its('body') { should eq inspec.profile.file('index.html') }

        end

    end

end
