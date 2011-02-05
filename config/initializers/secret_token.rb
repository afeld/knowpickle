# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Knowpickle::Application.config.secret_token = ENV['KNOWPICKLE_SECRET_TOKEN'] || '4fe2cecef586f890a4a1d68e8fd66c2f99c8a39cfd545dd5e42d0b103dd8acbe8156c3693c8def60799c90860b3f71ff2fb7d24f48373559f52c3ac12b031889'
