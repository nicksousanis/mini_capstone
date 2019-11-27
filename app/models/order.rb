class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calc_price_and_update
    subtotal = 0
    index = 0
    while index < carted_products.length
      subtotal = subtotal + (carted_products[index].product.price * carted_products[index].quantity)
      index += 1
    end
    self.subtotal = subtotal
    self.tax = self.subtotal * 0.10
    self.total = self.subtotal + self.tax
    self.save
  end
end
