namespace :movies do
desc "Top 3 movies filter"
    task :top3 do
		require 'csv'
	    puts "starting to read in CSV"

	    #assign each movie a total rating
	    movieTotals = Hash.new(0)
	    CSV.foreach('lib/assets/movies.csv', 'r') do |row|
	      row.each do |x|
	        entry = x.split(":")
	        rating = entry.first
	        title = entry.last
	        movieTotals[title] += Integer(rating)
	    	end
		end
	    
		# movieTotals = Hash.new(0)
  #       CSV.foreach("lib/assets/movies.csv", 'r') do |row|
  #           row.each do |entry|
  #               movieTotals[entry.split(":").last] += Integer(entry.split(":").first)
 	#     	end
 	#     end

	    best3Movies = movieTotals.sort_by { |title, rating| rating }.first(3)

   	    puts "And the top three movies are..."
		puts "1) " + best3Movies[0][0]
		puts "2) " + best3Movies[1][0]
		puts "3) " + best3Movies[2][0]
	end
end