require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:decks).dependent(:delete_all) }

  it { should validate_presence_of(:full_name) }
end
