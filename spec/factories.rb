FactoryGirl.define do
  
  #factory for project model
  factory :project do
    title                        "Test Project"
    description                  "Test Project Description"
  end

 #factory for picture model
  factory :picture do
    title                        "Test Project Description"
    image Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'image.png'), 'image/png')
    project
  end

  #devise user model
  factory :user do
    email       "user@example.com"
    password    "foobar1234"
  end

end

