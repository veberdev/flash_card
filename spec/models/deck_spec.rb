require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:questions).dependent(:delete_all) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(13) }
  it { should validate_presence_of(:description) }
end
