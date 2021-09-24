class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(:passengers)
           .select('passengers.*')
           .where('passengers.age > 17')
           .uniq
  end
end
