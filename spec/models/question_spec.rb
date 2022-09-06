require 'rails_helper'

RSpec.describe Question, type: :model do

  it { should belong_to(:deck) }

  it { should validate_inclusion_of(:question_type).in_array(Question::QUESTION_TYPES) }
  it { should validate_presence_of(:correct_answer) }
  context 'question_type == multiple_choice' do
    before { allow(subject).to receive(:presence_of_wrong_aswers?).and_return(true) }
    it { is_expected.to validate_presence_of(:wrong_answers) }
  end
end
