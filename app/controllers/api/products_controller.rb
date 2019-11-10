class Api::ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
    render "index.json.jb"
  end

  def show
    @current_product = params["id"].to_i
    @product = Product.find_by(id: "#{@current_product}")
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "create.json.jb"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.description = params[:input_description] || @product.description
    @product.save
    render "show.json.jb"
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully deleted" }
  end
end
