class Question < ApplicationRecord
  belongs_to :deck

  QUESTION_TYPES = ["multiple_choice", "user_correction"]

  validates :question_type, inclusion: { in: QUESTION_TYPES }, presence: true
  validates :correct_answer, presence: true
  validates :wrong_answers, presence: true, if: -> { presence_of_wrong_aswers? }

  def presence_of_wrong_aswers?
    self.question_type == "multiple_choice"
  end

end
