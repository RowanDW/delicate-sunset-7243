require 'rails_helper'

RSpec.describe 'the airline show page' do

  before :each do
    @airline1 = Airline.create!(name: "Delta")
    @airline2 = Airline.create!(name: "United")

    @flight1 = @airline1.flights.create!(number: 101, date: "01/01/2000", departure_city: "Denver", arrival_city: "Boston")
    @flight2 = @airline1.flights.create!(number: 102, date: "01/02/2000", departure_city: "Denver", arrival_city: "Minneapolis")
    @flight3 = @airline2.flights.create!(number: 103, date: "01/03/2000", departure_city: "L.A.", arrival_city: "Chicago")

    @pass1 = Passenger.create!(name: "Katya", age: 42)
    @pass2 = Passenger.create!(name: "Trixie", age: 35)
    @pass3 = Passenger.create!(name: "Lil Poundcake", age: 8)
    @pass4 = Passenger.create!(name: "Raven", age: 40)
    @pass5 = Passenger.create!(name: "Tammy", age: 47)
    @pass6 = Passenger.create!(name: "Latrice", age: 50)

    @me1 = ManifestEntry.create!(flight: @flight1, passenger: @pass1)
    @me2 = ManifestEntry.create!(flight: @flight1, passenger: @pass2)

    @me3 = ManifestEntry.create!(flight: @flight2, passenger: @pass1)
    @me4 = ManifestEntry.create!(flight: @flight2, passenger: @pass3)
    @me5 = ManifestEntry.create!(flight: @flight2, passenger: @pass4)

    @me6 = ManifestEntry.create!(flight: @flight3, passenger: @pass4)
    @me7 = ManifestEntry.create!(flight: @flight3, passenger: @pass5)
  end

  it "displays a distinct list of passengers over 17" do
    visit airline_path(@airline1)

    expect(page).to have_content(@airline1.name)

    within('#passengers') do
      expect(page).to have_content("Adult Passengers:")

      # passenger on 2 airline1 flights
      expect(page).to have_content(@pass1.name, count: 1)

      # passenger only on 1 airline1 flight
      expect(page).to have_content(@pass2.name)

      # passenger on airline1 flight but under 18
      expect(page).to_not have_content(@pass3.name)

      # passenger on both airline1 and airline2 flights
      expect(page).to have_content(@pass4.name)

      # passenger only on airline2 flight
      expect(page).to_not have_content(@pass5.name)

      # passenger not on any flights
      expect(page).to_not have_content(@pass6.name)
    end
  end
end
