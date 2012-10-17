class ProductCategory < ActiveRecord::Base
	attr_accessible :category_name, :category_id, :product_id
  belongs_to :product, :class_name => "Product"
  belongs_to :category, :class_name => "Category"
  
  def category_name
  	category.try(:name)
  end
  
  def category_name=(name)
  	self.category = Category.find_or_create_by_name(name) if name.present?
  end
end
