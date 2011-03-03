namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(:name => "Admin",
                       :email => "example@railstutorial.org",
		       :country => "Barbados",
		       :avatar => "Lion",
		       :mood => "Flirty",
                       :password => "testtest",
                       :password_confirmation => "testtest")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
		 :country => "Barbados",
		 :avatar => "Tiger",
		 :mood => "Crazy",
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = "TEST"
      user.microposts.create!(:content => content, :author => "Admin", :agree =>"0", :disagree => "0", :amused => "0", :belongs_to_id => "5", :mood => "Flirty" )
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end