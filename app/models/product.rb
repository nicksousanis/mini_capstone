class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  validates :name, :description, presence: true

  validates :description, length: { in: 2..500 }

  validates :price, numericality: { greater_than: 0 }

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
