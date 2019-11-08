class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "all_products.json.jb"
  end

  def show
    @current_product = params["id"].to_i
    @test = Product.find_by(id: "#{@current_product}")
    render "product_query.json.jb"
  end
end
