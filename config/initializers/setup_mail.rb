ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "customcamdevs@gmail.com",
  :password             => "customcamdev",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
