require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:deck) }
  it { should have_one(:question_data).dependent(:destroy) }
  it { should validate_inclusion_of(:question_type).in_array(Question::QUESTION_TYPES) }
  it { should validate_presence_of(:correct_answer) }
  context 'question_type == multiple_choice' do
    before { allow(subject).to receive(:presence_of_wrong_answers?).and_return(true) }
    it { is_expected.to validate_presence_of(:wrong_answer_n1) }
    it { is_expected.to validate_presence_of(:wrong_answer_n2) }
    it { is_expected.to validate_presence_of(:wrong_answer_n3) }
  end
end
