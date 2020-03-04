# Class for Data retention
class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDREN = 2

  attr_reader :title
  attr_reader :price

  def initialize(title, price)
    @title, @price = title, price
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end

