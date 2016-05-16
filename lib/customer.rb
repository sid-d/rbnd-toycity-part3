class Customer
	attr_reader :name, :age
	@@customers = []

	def initialize(info={})
		@name = info[:name]

		#new feature 1 - more details about customers
		@age = info[:age]
		@address = info[:address]

		add_to_customers
	end

	def add_to_customers
		@@customers << self
	end

	def self.all
		@@customers
	end

	def add_to_customers
		name_taken = false

		@@customers.each do |customer|
			if @name == customer.name
				name_taken = true
			end
		end

		if name_taken == true
				raise DuplicateCustomerError, "Duplicate Customer"
		else
				@@customers << self
		end
	end

	def self.find_by_name(name)
		found = false
		ind = nil

		@@customers.each do |customer|
			if name == customer.name
				return customer
			end
		end
	end

	def purchase(product)
		if product.stock == 0
			raise PurchaseNoStock, "Sorry, there is no stock for the product"
		else
			Transaction.new(self,product)
		end
	end

	def returned(product)
		product.stock += 1
	end

end