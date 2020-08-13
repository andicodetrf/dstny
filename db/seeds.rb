# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.random = Random.new(42)
num = 10

# Generate 10 random users
num.times do |idx|
  gender = idx % 2 == 1 ? "men" : "women"

  if gender == "men"
    username = Faker::Name.unique.male_first_name.downcase
  else
    username = Faker::Name.unique.female_first_name.downcase
  end

  email = Faker::Internet.free_email(name: username)
  password = "qwer1234"
  profile_description = Faker::TvShows::TheITCrowd.quote

  u = User.create! :username => username, :email => email, :password => password, :password_confirmation => password, :profile_description => profile_description

  image_url = "https://randomuser.me/api/portraits/#{gender}/#{idx + 1}.jpg"
  u.avatar.attach(io: URI.open(image_url), filename: "avatar_#{idx + 1}.jpg")
end

# Generate 10 random questions
# num.times do |idx|
#   option_1 = Faker::Verb.base
#   option_2 = Faker::Verb.base
#   question_text = "Should I " + option_1 + " or " + option_2 + "?"
#   description = Faker::TvShows::Friends.quote
#   expiry_date = Time.now + rand(6) * 60 * 60
#   user_id = 1 + rand(10)

#   Question.create!(
#     question_text: question_text,
#     description: description,
#     expiry_date: expiry_date,
#     user_id: user_id,
#   )

#   Option.create!(
#     option_text: option_1,
#     votes: 0,
#     voters: [],
#     question_id: idx + 1,
#   )

#   Option.create!(
#     option_text: option_2,
#     votes: 0,
#     voters: [],
#     question_id: idx + 1,
#   )
# end

# #Generate random comments
# (num * 2).times do |idx|
#   comment_text = Faker::TvShows::Simpsons.quote
#   question_id = 1 + rand(10)
#   user_id = 1 + rand(10)

#   Comment.create!(
#     comment_text: comment_text,
#     question_id: question_id,
#     user_id: user_id,
#   )
# end
