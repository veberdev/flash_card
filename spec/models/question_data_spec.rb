require 'rails_helper'

RSpec.describe QuestionData, type: :model do
  it { should belong_to(:question).dependent(:destroy) }
end
