ManifestEntry.destroy_all
Passenger.destroy_all
Flight.destroy_all
Airline.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:airlines)
ActiveRecord::Base.connection.reset_pk_sequence!(:flights)
ActiveRecord::Base.connection.reset_pk_sequence!(:passengers)
ActiveRecord::Base.connection.reset_pk_sequence!(:manifest_entries)

@airline1 = Airline.create!(name: "Delta")
@airline2 = Airline.create!(name: "United")

@flight0 = @airline1.flights.create!(number: 100, date: "12/31/1999", departure_city: "Orlando", arrival_city: "Seattle")
@flight1 = @airline1.flights.create!(number: 101, date: "01/01/2000", departure_city: "Denver", arrival_city: "Boston")
@flight2 = @airline1.flights.create!(number: 102, date: "01/02/2000", departure_city: "Denver", arrival_city: "Minneapolis")
@flight3 = @airline2.flights.create!(number: 103, date: "01/03/2000", departure_city: "L.A.", arrival_city: "Chicago")

@pass1 = Passenger.create!(name: "Katya", age: 42)
@pass2 = Passenger.create!(name: "Trixie", age: 35)
@pass3 = Passenger.create!(name: "Lil Poundcake", age: 8)
@pass4 = Passenger.create!(name: "Raven", age: 40)
@pass5 = Passenger.create!(name: "Tammy", age: 47)
@pass6 = Passenger.create!(name: "Latrice", age: 50)

@me1 = ManifestEntry.create!(flight: @flight1, passenger: @pass2)
@me2 = ManifestEntry.create!(flight: @flight1, passenger: @pass1)

@me3 = ManifestEntry.create!(flight: @flight2, passenger: @pass1)
@me4 = ManifestEntry.create!(flight: @flight2, passenger: @pass3)
@me5 = ManifestEntry.create!(flight: @flight2, passenger: @pass4)

@me6 = ManifestEntry.create!(flight: @flight0, passenger: @pass1)
@me7 = ManifestEntry.create!(flight: @flight0, passenger: @pass2)

@me8 = ManifestEntry.create!(flight: @flight3, passenger: @pass4)
@me9 = ManifestEntry.create!(flight: @flight3, passenger: @pass5)
