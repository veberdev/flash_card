class Question < ApplicationRecord
  belongs_to :deck

  QUESTION_TYPES = ["multiple_choice", "user_correction"]

  validates :question_type, inclusion: { in: QUESTION_TYPES }, presence: true
  validates :question, presence: true
  validates :correct_answer, presence: true
  validates :wrong_answer_n1, presence: true, if: -> { presence_of_wrong_answers? }
  validates :wrong_answer_n2, presence: true, if: -> { presence_of_wrong_answers? }
  validates :wrong_answer_n3, presence: true, if: -> { presence_of_wrong_answers? }

  def presence_of_wrong_answers?
    self.question_type == "multiple_choice"
  end

end
