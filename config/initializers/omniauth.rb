OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['fb_key'], ENV['fb_secret'],
  :scope => 'email', :display => 'popup', :info_fields => 'name,email'
end