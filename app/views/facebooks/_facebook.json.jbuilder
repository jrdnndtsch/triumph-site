json.extract! facebook, :id, :message, :link, :image_link, :title, :description, :created_at, :updated_at
json.url facebook_url(facebook, format: :json)