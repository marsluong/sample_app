# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.


require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = '2725f17dc06d64c1a4eeeb1b2ab1f8872ce5230c1ba0466d104b67517f600bb8e62ae80914017f7604416407eda912b334b0e68cc717a114f57fbfe991b59aa4'

