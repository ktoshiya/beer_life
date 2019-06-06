json.extract! post, :id, :content, :amount, :rating, :drink_date, :created_at, :updated_at
json.url post_url(post, format: :json)
