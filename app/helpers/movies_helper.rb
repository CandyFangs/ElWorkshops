module MoviesHelper
	def show_average_ratings (movie)
		movie.average_rating || 'No rating' 
	end

end
