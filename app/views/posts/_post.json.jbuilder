json.extract! post, :id, :title, :image, :content, :user_id, :cat_id, :created_at, :updated_at
json.url post_url(post, format: :json)
