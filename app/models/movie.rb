class Movie < ActiveRecord::Base
	has_many :ratings

	validates :title, presence: true
	validates :year, numericality: {greater_than: 1900, less_than: 2017}

	def average_rating
		ratings_array = ratings.map do |rating|
			rating.value
		end
		(ratings_array.sum / ratings_array.count.to_f).round(2)
	end
end
