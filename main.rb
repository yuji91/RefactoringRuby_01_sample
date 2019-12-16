require './movie.rb'
require './rental.rb'
require './customer.rb'

movie = Movie.new("movie_01", Movie::REGULAR)
rental = Rental.new(movie, 0)
customer = Customer.new("customer_01")

customer.add_rental(rental)

result = customer.statement
puts result