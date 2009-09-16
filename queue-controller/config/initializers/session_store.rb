# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_queue-controller_session',
  :secret      => 'cef4e48866bbbd984edef2a4606af62be4dbb898f4394b7162e4534de17bf55fabacfbc9482bee7dca5a38e3a87fe78e8b2e8835429846000060cd1dbe78df1f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
