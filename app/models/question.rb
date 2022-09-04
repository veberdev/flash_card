class Question < ApplicationRecord
  belongs_to :deck

  QUESTION_TYPES = ["multiple_choice", "user_correction"]

  validates :question_type, inclusion: { in: QUESTION_TYPES }, presence: true
  validates :correct_answer, presence: true
  #it's missing test for the next validation
  validates :wrong_answers, presence: true, if: -> { presence_of_wrong_aswers? }
  # validates :wrong_answers, presence: true, if: -> { self.question_type == "multiple_choice" }
  

  def presence_of_wrong_aswers?
    self.question_type == "multiple_choice"
  end

end
