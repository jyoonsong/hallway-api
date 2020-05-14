# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
    {
        first_name: "Jaeyoon",
        last_name: "Song",
        affiliation: "SNU",
        email: "song@jaeyoon.io",
        link: "https://jaeyoon.io",
        password_digest: BCrypt::Password.create('password1')
    },
    {
        first_name: "Thomas",
        last_name: "Malone",
        affiliation: "MIT",
        email: "malone@mit.edu",
        link: "https://malone.mit.edu",
        password_digest: BCrypt::Password.create('password2')
    },
    {
        first_name: "Juho",
        last_name: "Kim",
        affiliation: "KAIST",
        email: "juhokim@kaist.ac.kr",
        link: "https://juhokim.com",
        password_digest: BCrypt::Password.create('password3')
    },
    {
        first_name: "Lily",
        last_name: "Lala",
        affiliation: "somewhere",
        email: "something@email.com",
        link: "https://zoom.link",
        password_digest: BCrypt::Password.create('password4')
    },
    {
        first_name: "Lele",
        last_name: "Lolo",
        affiliation: "Haha",
        email: "where@email.com",
        link: "https://zoom.link.to.somewhere",
        password_digest: BCrypt::Password.create('password5')
    }

])

Wait.create([
    {
        waiting_id: 1,
        waiter_id: 2
    },
    {
        waiting_id: 4,
        waiter_id: 1
    }
])

Administrator.create(email: "admin@admin.com", password: "password", first_name: "Admin", last_name: "User")