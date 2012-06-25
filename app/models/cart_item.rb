class CartItem
   attr_reader :product, :quantity
   
   def initialize(Product object)
	@product = object
	@quantity = 1
   end

   def increment_quantity()
	quantity = quantity + 1
   end

   def title()
	return product.title
   end

   def price()
	return product.price
   end
end
