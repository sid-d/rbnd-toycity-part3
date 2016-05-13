class Product
	@@products = []

	def initialize(o={})
		@@products << self
	end

	def self.all
		@@products
	end

end