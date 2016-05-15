class Product
	attr_reader :title, :price
	attr_accessor :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def title
		@title
	end

	def add_to_products
		name_taken = false

		@@products.each do |product|
			if @title == product.title
				name_taken = true
			end
		end

		if name_taken == true
				raise DuplicateProductError, "Duplicate Product based on title"
		else
				@@products << self
		end
	end

	def self.find_by_title(name)
		found = false
		ind = nil

		@@products.each do |product|
			if name == product.title
				return product
			end
		end
	end

	def in_stock?
		@stock > 0 ? true : false
	end

	def self.in_stock
		in_stock_products = []
		@@products.each do |product|
			if product.in_stock? == true
				in_stock_products << product
			end
		end	
		return in_stock_products
	end
end

