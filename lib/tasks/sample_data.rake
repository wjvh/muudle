namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
#   Rake::Task['db:reset'].invoke
#   User.create!(:name => "Example User",
#                :email => "example@railstutorial.org",
#		 :avatar => "Lion",
#		 :mood => "Flirty",
#                :password => "foobar",
#                :password_confirmation => "foobar")
#    99.times do |n|
#      name  = Faker::Name.name
#      email = "example-#{n+1}@railstutorial.org"
#      password  = "password"
#      User.create!(:name => name,
#                   :email => email,
#		   :avatar => "Lion",
#		   :mood => "Flirty",
#                   :password => password,
#                   :password_confirmation => password)
#    end

    User.all(:limit => 1).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5), :author => "FakerScript", 
                                :agree => "0", :disagree => "0", :amused => "0")
      end
    end
  end
end