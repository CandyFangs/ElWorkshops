# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Download json with movies data
movies_json_url = URI('https://raw.githubusercontent.com/mlabouardy/Rated-Movies/master/client/data/top-rated.json')
movies_json = Net::HTTP.get(movies_json_url)
movies = JSON.parse(movies_json)['movies']

# Delete each movie from database
Movie.delete_all

# Iterate through each of movie
movies.take(200).each do |movie|
	puts '.'
  # Extract data about movie
  cover_url = movie['img']
  rating = movie['rating'].to_i
  title = movie['title']
  year = movie['year'].to_i
  tags = movie['tags'].map {|tag| tag['name']}
  description = movie['description']

  

  # Here you can use variables
  Movie.create!(
  	title: title, 
  	poster: cover_url, 
  	description: description, 
  	year: year
  	)
end
