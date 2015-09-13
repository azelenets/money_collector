# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(
  first_name: 'Mr.',
  last_name: 'Smart',
  email: 'mr.smart@moneycollector.com',
  password: 'password',
  password_confirmation: 'password'
)