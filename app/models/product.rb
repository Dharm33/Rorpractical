class Product < ApplicationRecord
	belongs_to :category
	# validates :quantity, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  # validates :price, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }

end
