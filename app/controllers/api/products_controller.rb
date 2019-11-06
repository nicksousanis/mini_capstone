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
end
