require 'rails_helper'

RSpec.describe Deck, type: :model do
  it { should belong_to(:user) }
end
