# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(user_name: 'Maxim', password: 'password', session_token: 'abcdedfg')
user2 = User.create!(user_name: 'Farah', password: 'secret', session_token: 'xyz')


