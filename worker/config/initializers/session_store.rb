# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_worker_session',
  :secret      => '0d969d1099a8759bea298fe28833d9fa8affae82d9c36188c1b4cff3612c9bcbc95ec0c295a3ace12c7be2b0c9d81dca1a267cb45123d8998f46235b56572b83'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
