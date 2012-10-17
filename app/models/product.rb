class Product < ActiveRecord::Base
attr_accessible :name, :price, :description, :product_categories_attributes, :product_exercises_attributes, :related_products_attributes, :pictures_attributes
  has_many :product_categories, :foreign_key => "product_id", :dependent => :destroy
  has_many :categories, :through => :product_categories
  accepts_nested_attributes_for :product_categories, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :product_exercises, :foreign_key => "product_id", :dependent => :destroy
  has_many :exercises, :through => :product_exercises
  accepts_nested_attributes_for :product_exercises, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :pictures, :foreign_key => "product_id", :dependent => :destroy
  accepts_nested_attributes_for :pictures, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :related_products, :foreign_key => "follower_id", :dependent => :destroy
  has_many :relations, through: :related_products, source: :followed
  accepts_nested_attributes_for :related_products, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "RelatedProduct",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
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
