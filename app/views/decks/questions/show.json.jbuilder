json.question do
  json.(@question, :id, :question, :correct_answer, :wrong_answers, :question_type)
end
