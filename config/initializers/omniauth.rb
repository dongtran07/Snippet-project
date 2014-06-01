OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '452617783774-1uj2n9mgfsvn0fb9cadsb15cb63g0tjp.apps.googleusercontent.com', 'hBQIMfclog1nSOGJ2F1O51hy', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end