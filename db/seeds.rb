User.create!(name:  "テストユーザー",
  email: "test@test.com",
  password:              "password",
  password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(
    beer_name: "スーパードライ",
    content: "美味しかったなぁ",
    count: 5,
    drink_date: "2019-5-1"
  ) }
end