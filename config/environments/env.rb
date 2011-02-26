Muudle::Application.configure do

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "mail.muudle.com",
  :port                 => 26,
  :domain               => 'muudle.com',
  :user_name            => 'muudlebot+muudle.com',
  :password             => 'baj_muudlebot!',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

end
