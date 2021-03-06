class ProductExercise < ActiveRecord::Base
	attr_accessible :exercise_name, :product_id, :exercise_id
  belongs_to :product, :class_name => "Product"
  belongs_to :exercise, :class_name => "Exercise"
  
  def exercise_name
  	exercise.try(:name)
  end
  
  def exercise_name=(name)
  	self.exercise = Exercise.find_or_create_by_name(name) if name.present?
  end
end
