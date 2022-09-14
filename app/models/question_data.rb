class QuestionData < ApplicationRecord
  belongs_to :question, dependent: :destroy

  def wrong_times
    times_done - correct_times
  end

  def update_data(correct_answer)
    if self.question.correct_answer == correct_answer
      self.correct_times += 1
    end
      self.times_done += 1
      self.show_up_coeficient = ((wrong_times.to_f/times_done.to_f) * 100).to_i
      self.save
  end
end
