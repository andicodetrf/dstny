class Category < ApplicationRecord
    has_many :questions 
  
    # has_many :question_categories
    # has_many :questions , through: :question_categories
end
