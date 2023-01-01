# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  School.with_deleted.destroy_all
  Student.with_deleted.destroy_all

  ActiveRecord::Base.connection.reset_pk_sequence!('schools')

  School.create(name: Faker::Name.name)
  School.create(name: Faker::Name.name)

  Student.create(name: Faker::Name.name, school_id: 1, email: 'fake1@gmail.com', password: '123456789', password_confirmation: '123456789')
  Student.create(name: Faker::Name.name, school_id: 1, email: 'fake2@gmail.com', password: '123456789', password_confirmation: '123456789')
  Student.create(name: Faker::Name.name, school_id: 2, email: 'fake3@gmail.com', password: '123456789', password_confirmation: '123456789')
end
