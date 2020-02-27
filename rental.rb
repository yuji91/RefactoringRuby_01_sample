# Rental Information for a Video
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    this_amount = 0
    case movie.price_code
    when Movie::REGULAR
      this_amount += 2
      this_amount +=(days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      this_amount += days_rented * 3
    when Movie::CHILDRENS
      this_amount += 1.5
      this_amount +=(days_rented - 3) * 1.5 if days_rented > 3
    end
    this_amount
  end

  def frequent_renter_points
    # add rental points
    frequent_renter_points = 1

    # add bonus point for new_release 2-day rentals
    if movie.price_code == Movie::NEW_RELEASE && days_rented > 1
      frequent_renter_points += 1
    end
    frequent_renter_points
  end
end
