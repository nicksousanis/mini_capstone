class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    @carted_products = current_user.carted_products.where(status: :carted)
    @subtotal = 0
    index = 0
    while index < @carted_products.length
      @subtotal = @subtotal + (@carted_products[index].product.price * @carted_products[index].quantity)
      index += 1
    end
    tax = @subtotal * 0.10
    total = @subtotal + tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: @subtotal,
      tax: tax,
      total: total,

    )

    if @order.save
      index = 0
      while index < @carted_products.length
        @carted_products[index].status = "purchased"
        @carted_products[index].order_id = @order.id
        @carted_products[index].save
        index += 1
      end
      render "show.json.jb"
    else
      render json: { Error: "Not working" }
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end
end
