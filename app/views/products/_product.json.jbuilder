json.extract! product, :id, :title, :description, :price, :in_stock, :brand_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
