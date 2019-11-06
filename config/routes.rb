Rails.application.routes.draw do
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    get "/product_one_url" => 
    get "/product_two_url"
    get "/product_three_url"
    get "/"
  end
end
