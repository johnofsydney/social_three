# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create(
  [
    {name: 'tom', email: 'tom@foo.net', password: 'chicken'},
    {name: 'dick', email: 'dick@foo.net', password: 'chicken'},
    {name: 'harry', email: 'harry@foo.net', password: 'chicken'},
  ]
)

blogs = Blog.create(
  [
    {content: 'lorem', user: users.first},
    {content: 'ipsum', user: users.first},
    {content: 'facto', user: users.first},
    {content: 'loremio', user: users.second},
    {content: 'ipsum dipsum', user: users.second},
    {content: 'facto dilacto', user: users.last},
  ]
)