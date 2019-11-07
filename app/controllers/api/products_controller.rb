class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jb"
  end

  def product_one_method
    @product_one = Product.first
    render "first_product.json.jb"
  end

  def product_two_method
    @product_two = Product.second
    render "second_product.json.jb"
  end

  def product_three_method
    @product_three = Product.third
    render "third_product.json.jb"
  end

  def product_four_method
    @product_four = Product.fourth
    render "fourth_product.json.jb"
  end

  def product_five_method
    @product_five = Product.fifth
    render "fifth_product.json.jb"
  end

  def product_query_method
    @current_product = params["id"].to_i
    @test = Product.find_by(id: "#{@current_product}")
    # if @current_product > -1
    #   @test = {
    #     id: Product.all[@current_product].id,
    #     name: Product.all[@current_product].name,
    #     price: Product.all[@current_product].price,
    #     image_url: Product.all[@current_product].image_url,
    #     description: Product.all[@current_product].description,
    #   }
    # end
    render "product_query.json.jb"
  end
end
