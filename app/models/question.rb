class Question < ApplicationRecord
  paginates_per 6

  belongs_to :deck

  has_one :question_data, dependent: :destroy

  QUESTION_TYPES = %w[multiple_choice user_correction].freeze

  validates :question_type, inclusion: { in: QUESTION_TYPES }, presence: true
  validates :question, presence: true
  validates :correct_answer, presence: true
  validates :wrong_answer_n1, presence: true, if: -> { presence_of_wrong_answers? }
  validates :wrong_answer_n2, presence: true, if: -> { presence_of_wrong_answers? }
  validates :wrong_answer_n3, presence: true, if: -> { presence_of_wrong_answers? }

  after_create :create_question_data

  def presence_of_wrong_answers?
    question_type == 'multiple_choice'
  end

  def create_question_data
    self.question_data = QuestionData.create
  end

  def self.to_study
    QuestionData.where(question_id: self.pluck(:id)).order(:show_up_coeficient).first.question
  end

end
