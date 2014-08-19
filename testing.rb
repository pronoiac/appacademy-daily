require_relative "questionsdatabase"
require "debugger"

def user_testing
  puts "== user testing =="
  u = User.new

  puts "find by id"
  p User.find_by_id(1)
  
  puts "\nfind by name"
  sean = User.find_by_name("Sean", "Connery")
  p sean
  
  puts "\nauthored questions"
  p sean.authored_questions
  
  puts "\nauthored replies"
  p sean.authored_replies
end

def question_testing
  puts "== question testing =="
  puts "\nfind author by id"
  best_questions = Question.find_by_author_id(1)
  p best_questions
  best_question = best_questions.first
  p best_question
  
  puts "\nauthor"
  p best_question.author
  
  puts "\nreplies"
  p best_question.replies
end

# user_testing
# puts "\n\n"
question_testing