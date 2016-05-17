class Transaction
	attr_reader :customer, :product, :id
	@@id=1
	@@products=[]
	@@transactions=[]

	def initialize(customer,product)
		@customer = customer
		@product = product
		raise PurchaseNoStock, "Sorry, there is no stock for the product" if product.stock == 0 
		@id = @@id
		@@id += 1
		@product.stock -= 1
		@@products << @product
		@@transactions << self
	end

	def self.all
		@@transactions
	end

	def self.find(index)
		@@transactions.select {|x| x.id == index}[0]
	end

end
