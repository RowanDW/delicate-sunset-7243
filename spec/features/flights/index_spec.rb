require 'rails_helper'

RSpec.describe 'the flights index page' do

  before :each do
    @airline1 = Airline.create!(name: "Delta")
    @airline2 = Airline.create!(name: "United")

    @flight1 = @airline1.flights.create!(number: 101, date: "01/01/2000", departure_city: "Denver", arrival_city: "Boston")
    @flight2 = @airline1.flights.create!(number: 102, date: "01/02/2000", departure_city: "Denver", arrival_city: "Minneapolis")
    @flight3 = @airline2.flights.create!(number: 103, date: "01/03/2000", departure_city: "L.A.", arrival_city: "Chicago")
    @flight4 = @airline2.flights.create!(number: 104, date: "01/04/2000", departure_city: "Denver", arrival_city: "Houston")
    @flights = [@flight1, @flight2, @flight3, @flight4]

    @pass1 = Passenger.create!(name: "Katya", age: 42)
    @pass2 = Passenger.create!(name: "Trixie", age: 35)
    @pass3 = Passenger.create!(name: "Bob", age: 36)
    @pass4 = Passenger.create!(name: "Raven", age: 40)
    @pass5 = Passenger.create!(name: "Tammy", age: 47)
    @pass6 = Passenger.create!(name: "Latrice", age: 50)

    @me1 = ManifestEntry.create!(flight: @flight1, passenger: @pass1)
    @me1 = ManifestEntry.create!(flight: @flight1, passenger: @pass2)

    @me1 = ManifestEntry.create!(flight: @flight2, passenger: @pass1)
    @me1 = ManifestEntry.create!(flight: @flight2, passenger: @pass3)
    @me1 = ManifestEntry.create!(flight: @flight2, passenger: @pass4)

    @me1 = ManifestEntry.create!(flight: @flight3, passenger: @pass5)
    @me1 = ManifestEntry.create!(flight: @flight3, passenger: @pass6)

  end

  it "Shows all the flight numbers and airline name" do
    visit flights_path

    expect(page).to have_content("All Flights")

    within("#flight-#{@flight1.id}") do
      expect(page).to have_content("Flight ##{@flight1.id}")
      expect(page).to have_content("Airline: #{@airline1.name}")
    end
    within("#flight-#{@flight2.id}") do
      expect(page).to have_content("Flight ##{@flight2.id}")
      expect(page).to have_content("Airline: #{@airline1.name}")
    end
    within("#flight-#{@flight3.id}") do
      expect(page).to have_content("Flight ##{@flight3.id}")
      expect(page).to have_content("Airline: #{@airline2.name}")
    end
    within("#flight-#{@flight4.id}") do
      expect(page).to have_content("Flight ##{@flight4.id}")
      expect(page).to have_content("Airline: #{@airline2.name}")
    end

  end

  it "shows all passengers for each flight" do
    visit flights_path

    within("#flight-#{@flight1.id}") do
      expect(page).to have_content("Passengers:")
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
    end
    within("#flight-#{@flight2.id}") do
      expect(page).to have_content("Passengers:")
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).to_not have_content(@passenger1.name)
    end
    within("#flight-#{@flight3.id}") do
      expect(page).to have_content("Passengers:")
      expect(page).to have_content(@passenger5.name)
      expect(page).to have_content(@passenger6.name)
      expect(page).to_not have_content(@passenger3.name)
    end
    within("#flight-#{@flight4.id}") do
      expect(page).to have_content("Passengers:")
      expect(page).to_not have_content(@passenger1.name)
      expect(page).to_not have_content(@passenger6.name)
  end
end
