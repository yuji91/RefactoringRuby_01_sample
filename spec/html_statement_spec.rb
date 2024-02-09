RSpec.describe  do
  require './movie.rb'
  require './rental.rb'
  require './customer.rb'
  require './regular_price'
  require './new_release_price'
  require './children_price'

  describe 'html statement method' do
    it 'is correct to output result from html statement method' do
      movie = Movie.new("movie_01", RegularPrice.new)
      rental = Rental.new(movie, 0)
      customer = Customer.new("customer_01")

      customer.add_rental(rental)

      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t2\n<p>You owe <em>2</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
      expect(result).to match expected_result
    end

    it 'is correct to output days_rented_logic from html statement method' do
      # movie: regular and days_rented 3 --> 3.5
      movie = Movie.new("movie_01", RegularPrice.new)
      rental = Rental.new(movie, 3)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t3.5\n<p>You owe <em>3.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
      expect(result).to match expected_result

      # movie: new_release && days_rented: 5 --> 15, 2 frequents
      movie = Movie.new("movie_01", NewReleasePrice.new)
      rental = Rental.new(movie, 5)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t15\n<p>You owe <em>15</em><p>\nOn this rental you earned <em>2</em> frequent renter points<p>"
      expect(result).to match expected_result

      # movies: new_release && days_rented: 3
      # movies: new_release && days_rented: 5 --> 24, 4 frequents
      movie_1 = Movie.new("movie_01", NewReleasePrice.new)
      movie_2 = Movie.new("movie_02", NewReleasePrice.new)
      rental_1 = Rental.new(movie_1, 3)
      rental_2 = Rental.new(movie_2, 5)
      customer = Customer.new("customer_01")
      customer.add_rental(rental_1)
      customer.add_rental(rental_2)
      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t9\n\tmovie_02\t15\n<p>You owe <em>24</em><p>\nOn this rental you earned <em>4</em> frequent renter points<p>"
      expect(result).to match expected_result

      # movie: children && days_rented: 10 --> 12.0
      movie = Movie.new("movie_01", ChildrenPrice.new)
      rental = Rental.new(movie, 10)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t12.0\n<p>You owe <em>12.0</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
      expect(result).to match expected_result
    end
  end
end

