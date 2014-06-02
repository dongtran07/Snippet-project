OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '452617783774-6mr76gcfdff53fsldfqd9690rv4vmjko.apps.googleusercontent.com', 'hIDap15DkHdBttlTBValf_oV', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end