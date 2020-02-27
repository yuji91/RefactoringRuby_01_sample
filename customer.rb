# Rental Information for a Video
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  # create receipt
  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name} \n"
    @rentals.each do |element|
      # add rental points
      frequent_renter_points += 1

      # add bonus point for new_release 2-day rentals
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # show prices for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      total_amount += element.charge
    end

    # add footer row
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
