# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_roles_session',
  :secret      => '26c55d4f729b7c0afdb94e66d4b375310298a9a35424f676b73b7251b48494047a66b1c00046391360a48eca075390bc602cdfd7c1b4269e37ae93714c8dbf17'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
