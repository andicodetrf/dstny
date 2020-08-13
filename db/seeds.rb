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

  if idx == 0
    role = 1
  else
    role = 0
  end

  u = User.create! :username => username, :email => email, :password => password, :password_confirmation => password, :profile_description => profile_description, :role => role

  image_url = "https://randomuser.me/api/portraits/#{gender}/#{idx + 1}.jpg"
  u.avatar.attach(io: URI.open(image_url), filename: "avatar_#{idx + 1}.jpg")
end

c_seed = [
  "", "relationship", "fashion", "food", "colour", "career", "travel", "exercise", "pets",
]
q_seed = [
  { "question_text" => "What should I wear to dinner?", "description" => "Family dinner on Sunday", "category_id" => 2 },
  { "question_text" => "Should I stay home and take a nap or go for a 10km run?", "description" => "decide for meeeeee", "category_id" => 8 },
  { "question_text" => "Where should I bring my pet for a walk?", "description" => "go where leh", "category_id" => 9 },
  { "question_text" => "What should i eat for lunch today?", "description" => "hungry liao", "category_id" => 4 },
  { "question_text" => "Is my dog cute?", "description" => "better answer correctly", "category_id" => 9 },
  { "question_text" => "Are you there guys?", "description" => "hello...", "category_id" => 1 },
  { "question_text" => "Where should i go for my next holiday?", "description" => "thinking of what to do. so bored", "category_id" => 7 },
  { "question_text" => "Should I break up?", "description" => "i really don't know what to do now. I saw some one cute in my software engineering class.", "category_id" => 2 },
  { "question_text" => "Who should i date?", "description" => "there's this 2 really cute boys", "category_id" => 2 },
  { "question_text" => "Should I accept the job offer?", "description" => "what to do", "category_id" => 6 },
  { "question_text" => "Do you want to meet my interns?", "description" => "You may be able to learn a lot from them.", "category_id" => 6 },
  { "question_text" => "What color socks/undies to wear", "description" => "to look hot or not", "category_id" => 2 },
  { "question_text" => "Which pet should i get", "description" => "as a lifelong companion", "category_id" => 9 },
  { "question_text" => "Should i have hipster coffee or bubble tea?", "description" => "Help me decide which is more hipster. ", "category_id" => 4 },
  { "question_text" => "Should i get a driving license", "description" => "for the environment.. or convenience.. or to stay in a secluded carpark", "category_id" => 2 },
  { "question_text" => "Should I go to my tinder date's place on the first date?", "description" => "He's kinda cute but i like to play hard to get. Hmm", "category_id" => 2 },
  { "question_text" => "A cute guy just texted me. Should i reply instantly or wait 3 days?", "description" => "I kinda wanna get things going but i don't wanna look too desperate.", "category_id" => 2 },
  { "question_text" => "Should i get a corgi or a frenchie for my next dog?", "description" => "I love both. it's a tough choice", "category_id" => 9 },
  { "question_text" => "How much should i give for a colleague's wedding?", "description" => "I don't want to look too stingy but i don't really like my colleague", "category_id" => 1 },
]

o_seed = [
  [{ "option_text" => "Dress" }, { "option_text" => "Pantsuit" }],
  [{ "option_text" => "Stay home " }, { "option_text" => "10 km run" }, { "option_text" => "10km run at home" }],
  [{ "option_text" => "Macritchie Resevoir" }, { "option_text" => "Bukit Timah Nature Reserve" }, { "option_text" => "East Coast Park" }],
  [{ "option_text" => "Chicken rice" }, { "option_text" => "Arnold's" }, { "option_text" => "auntie's xia mian" }, { "option_text" => "beef flank and asparagus" }],
  [{ "option_text" => "Yes" }, { "option_text" => "Yes" }],
  [{ "option_text" => "I'm stuck" }, { "option_text" => "I need help" }, { "option_text" => "Sorry, ebere" }, { "option_text" => "Candy needs a toilet break" }],
  [{ "option_text" => "Singapore Zoo" }, { "option_text" => "Sentosa" }, { "option_text" => "Marina Bay Sands" }, { "option_text" => "Bukit Timah Hill" }],
  [{ "option_text" => "No" }, { "option_text" => "Maybe" }],
  [{ "option_text" => "Randall" }, { "option_text" => "Render" }],
  [{ "option_text" => "Yes" }, { "option_text" => "No" }],
  [{ "option_text" => "No" }, { "option_text" => "No" }, { "option_text" => "Sign a petition" }],
  [{ "option_text" => "red" }, { "option_text" => "dirty white" }, { "option_text" => "puke green" }],
  [{ "option_text" => "human centipede" }, { "option_text" => "snake" }],
  [{ "option_text" => "hipster coffee" }, { "option_text" => "bubble tea" }],
  [{ "option_text" => "no, i like to be driven " }, { "option_text" => "yes, i like to drive people crazy" }],
  [{ "option_text" => "Go for it!" }, { "option_text" => "2nd date maybe!" }, { "option_text" => "3rd date maybe!" }],
  [{ "option_text" => "Reply him some time today" }, { "option_text" => "Reply him after 3 days" }],
  [{ "option_text" => "Corgi" }, { "option_text" => "Frenchie" }],
  [{ "option_text" => "20" }, { "option_text" => "50" }, { "option_text" => "88" }],
]

c_seed.each_with_index do |c, idx|
  Category.create(
    id: idx + 1,
    cat_type: c,
  )
end

q_seed.each_with_index do |q, idx|
  Question.create!(
    id: idx + 1,
    question_text: q["question_text"],
    description: q["description"],
    expiry_date: Time.now + rand(6) * 60 * 60,
    user_id: idx % 10 + 1,
    category_id: q["category_id"],
    status: true,
  )

  w_vote_count = rand(1..9)
  votes_arr = [w_vote_count, 10 - w_vote_count, 0, 0]
  basearr = (1..10).to_a.shuffle
  voters_arr = [basearr[0..w_vote_count - 1], basearr[w_vote_count..10], [], []]

  o_seed[idx].each_with_index do |o, i|
    Option.create(
      option_text: o["option_text"],
      votes: votes_arr[i],
      voters: voters_arr[i],
      question_id: idx + 1,
    )
  end
end

comment_seed = [
  { "comment_text" => "Wear the blue dress la", "question_id" => 1 },
  { "comment_text" => "don't wear anything", "question_id" => 1 },
  { "comment_text" => "police station", "question_id" => 3 },
  { "comment_text" => "fire station", "question_id" => 3 },
  { "comment_text" => "no, cats are the best", "question_id" => 5 },
  { "comment_text" => "Lol no need to reply if you're gonna wait 3 days", "question_id" => 17 },
  { "comment_text" => "DM me if he doesn't text you back", "question_id" => 17 },
  { "comment_text" => "scoop water from toilet bowl", "question_id" => 14 },
  { "comment_text" => "lee kuan yew house", "question_id" => 3 },
  { "comment_text" => "find a sugar daddy", "question_id" => 10 },
  { "comment_text" => "just 'fall sick' on the day itself", "question_id" => 19 },
  { "comment_text" => "put cardboard inside and dont sign your name", "question_id" => 19 },
  { "comment_text" => "call 8808 1395 for a good time", "question_id" => 2 },
  { "comment_text" => "dont be weak, run 30km", "question_id" => 2 },
  { "comment_text" => "dabian", "question_id" => 4 },
  { "comment_text" => "MLXG", "question_id" => 4 },
]

comment_seed.each do |c|
  Comment.create(
    comment_text: c["comment_text"],
    question_id: c["question_id"],
    user_id: 1 + rand(10),
  )
end
