require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to(:airline) }
    it { should have_many(:manifest_entries) }
    it { should have_many(:passengers).through(:manifest_entries) }
  end
end
