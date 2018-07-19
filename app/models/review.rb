class Review < ActiveRecord::Base

    belongs_to :product

    validates :description, presence: true
    validates :rating, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end