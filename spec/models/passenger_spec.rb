require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many(:manifest_entries) }
    it { should have_many(:flights).through(:manifest_entries) }
  end

  before :each do
    @airline1 = Airline.create!(name: "Delta")
    @flight0 = @airline1.flights.create!(number: 100, date: "12/31/1999", departure_city: "Orlando", arrival_city: "Seattle")
    @pass1 = Passenger.create!(name: "Katya", age: 42)
    @me6 = ManifestEntry.create!(flight: @flight0, passenger: @pass1)
  end

  describe 'instance methods' do
    describe 'get_manifest_entry' do
      it 'returns the manifest entry of the passenget and given flight' do
        expect(@pass1.get_manifest_entry(@flight0).id).to eq(@me6.id)
      end
    end
  end
end
