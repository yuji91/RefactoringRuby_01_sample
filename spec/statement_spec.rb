RSpec.describe  do
  require './movie.rb'
  require './rental.rb'
  require './customer.rb'
  require './regular_price'
  require './new_release_price'
  require './children_price'

  describe 'statement method' do
    it 'is correct to output result from statement method' do
      movie = Movie.new("movie_01", Movie::REGULAR)
      rental = Rental.new(movie, 0)
      customer = Customer.new("customer_01")

      customer.add_rental(rental)

      result = customer.statement
      expected_result = "Rental Record for customer_01 \n\tmovie_01\t2\nAmount owed is 2\nYou earned 1 frequent renter points"
      expect(result).to match expected_result
    end

    it 'is correct to output days_rented_logic from statement method' do
      # movie: regular and days_rented 3 --> 3.5
      movie = Movie.new("movie_01", Movie::REGULAR)
      rental = Rental.new(movie, 3)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.statement
      expected_result = "Rental Record for customer_01 \n\tmovie_01\t3.5\nAmount owed is 3.5\nYou earned 1 frequent renter points"
      expect(result).to match expected_result

      # movie: new_release && days_rented: 5 --> 15
      movie = Movie.new("movie_01", Movie::NEW_RELEASE)
      rental = Rental.new(movie, 5)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.statement
      expected_result = "Rental Record for customer_01 \n\tmovie_01\t15\nAmount owed is 15\nYou earned 2 frequent renter points"
      expect(result).to match expected_result

      # movie: children && days_rented: 10 --> 12.0
      movie = Movie.new("movie_01", Movie::CHILDREN)
      rental = Rental.new(movie, 10)
      customer = Customer.new("customer_01")
      customer.add_rental(rental)
      result = customer.statement
      expected_result = "Rental Record for customer_01 \n\tmovie_01\t12.0\nAmount owed is 12.0\nYou earned 1 frequent renter points"
      expect(result).to match expected_result
    end
  end
end
