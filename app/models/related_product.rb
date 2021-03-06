class RelatedProduct < ActiveRecord::Base
  attr_accessible :product_name, :follower_id, :followed_id
  belongs_to :follower, class_name: "Product"
  belongs_to :followed, class_name: "Product"
  
  def product_name
  	followed.try(:name)
  end
  
  def product_name=(name)
  	self.followed = Product.find_or_create_by_name(name) if name.present?
  end
end
