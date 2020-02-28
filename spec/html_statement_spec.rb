RSpec.describe  do
  require './movie.rb'
  require './rental.rb'
  require './customer.rb'

  describe 'html statement method' do
    it 'is correct to output result from html statement method' do
      movie = Movie.new("movie_01", Movie::REGULAR)
      rental = Rental.new(movie, 0)
      customer = Customer.new("customer_01")

      customer.add_rental(rental)

      result = customer.html_statement
      expected_result = "<h1>Rentals for <em>customer_01</em><h1><p>\n\tmovie_01\t2\n<p>You owe <em>2</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"
      expect(result).to match expected_result
    end
  end
end
