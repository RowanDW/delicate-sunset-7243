require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many(:manifest_entries) }
    it { should have_many(:flights).through(:manifest_entries) }
  end
end
