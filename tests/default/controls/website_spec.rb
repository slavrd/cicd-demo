control "website" do
    
    describe http('http://localhost') do
        its('status') { should cmp 200 }
        its('body') { should match "<h1>Basic CI/CD pipeline demo!</h1>\n"}
    end

end