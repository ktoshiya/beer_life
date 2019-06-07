json.extract! post, :id, :beer_name, :content, :count, :rating, :drink_date, :created_at, :updated_at
json.url post_url(post, format: :json)
