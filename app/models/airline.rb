class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(:passengers)
           .select('passengers.*, COUNT(flights.id) AS flight_count')
           .where('passengers.age > 17')
           .group('passengers.id')
           .order(flight_count: :desc)
           .uniq
  end
end
