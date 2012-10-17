class Exercise < ActiveRecord::Base
	attr_accessible :name
  has_many :exercise_products, :foreign_key => "exercise_id",
                                   			 :class_name => "ProductExercise",
                                   			 :dependent => :destroy
  has_many :products, :through => :exercise_products
  
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
