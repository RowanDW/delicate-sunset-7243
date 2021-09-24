require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
  end

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

  describe 'instance methods' do
    describe '.adult_passengers' do
      it "returns a distinct list of adult passengers on all airline flights" do
        # pass1 on 2 airline1 flights
        # pass2 only on 1 airline1 flight
        # pass3 on airline1 flight but under 18
        # pass4 on both airline1 and airline2 flights
        # pass5 only on airline2 flight
        # pass6 not on any flights

        expect(@airline1.adult_passengers.first.name).to eq(@pass1.name)
        expect(@airline1.adult_passengers.second.name).to eq(@pass2.name)
        expect(@airline1.adult_passengers.third.name).to eq(@pass4.name)
      end
    end
  end
end
