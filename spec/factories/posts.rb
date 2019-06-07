FactoryBot.define do
  factory :post do
    beer_name { "MyString" }
    content { "MyText" }
    count { 1 }
    rating { 1 }
    drink_date { "2019-06-06" }
  end
end
