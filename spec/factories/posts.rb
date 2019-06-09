FactoryBot.define do
  factory :post do
    beer_name { "MyString" }
    content { "MyText" }
    count { 1 }
    drink_date { "2019-06-06" }
    picture { "sample.jpg" }
  end
end
