require 'rails_helper'

RSpec.describe Question, type: :model do

  it { should belong_to(:deck) }

  it { should validate_inclusion_of(:question_type).in_array(["multiple_choice", "user_correction"]) }
  it { should validate_presence_of(:correct_answer) }
end
