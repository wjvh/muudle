Muudle::Application.configure do

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "mail.muudle.com",
  :port                 => 26,
  :user_name            => 'muudlebot+muudle.com',
  :password             => 'baj_muudlebot!',
  :authentication       => 'login',
  :enable_starttls_auto => true  }

end
