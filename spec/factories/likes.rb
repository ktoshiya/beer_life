# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    post
    user { post.user }
  end
end
