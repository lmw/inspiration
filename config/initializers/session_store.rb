# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_inspiration_session',
  :secret      => 'd57ce5d5f2d3ff17fe2e646f21ddf8ccf7ff94f1d395a4e759142ad90063fc06c4625059adbbe2b8a2273b9b68e4d1665b894fc952d0dcdc2955f1fcbb16476f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
