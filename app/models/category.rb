class Category < ActiveRecord::Base
	attr_accessible :name
  has_many :category_products, :foreign_key => "category_id",
                                   			 :class_name => "ProductCategory",
                                   			 :dependent => :destroy
  has_many :products, :through => :category_products
  
  def self.search(search)
  	if search
			words = search.to_s.strip.split
		  words.inject(scoped) do |combined_scope, word|
		    combined_scope.where('LOWER(name) LIKE ?',"%#{word.downcase}%")
		  end
  	else
  		return find(:all)
  	end
  end
  
end
