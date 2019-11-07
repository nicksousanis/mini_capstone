Rails.application.routes.draw do
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    get "/product_one_url" => "products#product_one_method"
    get "/product_two_url" => "products#product_two_method"
    get "/product_three_url" => "products#product_three_method"
    get "/product_four_url" => "products#product_four_method"
    get "/pruduct_five_url" => "products#product_five_method"
    get "/products" => "products#product_query_method"
    get "/products/:id" => "products#product_query_method"
  end
end
