require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:decks) }

  it { should validate_presence_of(:full_name) }
end

