require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { should validate_presence_of :rating }
  end

  describe 'relationships' do
    it { should belong_to :movie }
  end
end
