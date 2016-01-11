ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :authentication => :login,
  :user_name => "[mullentucker@gmail.com]",
  :password => Rails.application.secrets.gmail_password
}
