class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount]
      @products = @products.where("price < ?", 100)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.all.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.all.order(price: :desc)
    else
      @products = @products.all.order(:id)
    end

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

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
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      image = Image.new(
        url: params[:image_url],
        product_id: @product.id,
      )
      image.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully deleted" }
  end
end
