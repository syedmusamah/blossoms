class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  
   def self.find_products_for_sale
     find(:all, :order => "title")
   end
  protected
    def price_must_be_at_least_a_cent
      if(price.nil? || price < 0.01)
	  errors.add(:price,'should be at least 0.01')
      end
    end
    
    validates_format_of :image_url,
			:with => %r{\.(gif|jpg|png)$}i,
			:message => 'must be a URL for
			GIF, JGP, or PNG image.'
end
