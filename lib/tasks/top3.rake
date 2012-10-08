namespace :movies do
desc "Top 3 movies filter"
    task :top3 do
		require 'csv'
	    puts "starting to read csv"

	    #assign each movie a total rating
	    movies = Hash.new()
	    CSV.foreach('/lib/assets/movies.csv', 'r') do |row|
	      row.each do |x|
	        entry = x.split(':')
	        rating = entry[0]
	        title = entry[1]
	        movies[title] += Integer(rating)
	    	end
		end
	    
	    best3Movies = movies.sort_by { |title, rating| rating }.first(3)

	    puts "And the top three movies are"
	 	puts "1) " + ordered_movies[0][0]
		puts "2) " + ordered_movies[1][0]
		puts "3) " + ordered_movies[2][0]
    end
end