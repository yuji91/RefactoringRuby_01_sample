RSpec.describe  do
  require './movie.rb'
  require './rental.rb'
  require './customer.rb'

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
  end
end
