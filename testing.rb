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
  
  puts "\nfollowed questions"
  p sean.followed_questions
  
  puts "\nliked_questions"
  p sean.liked_questions
  
  puts "\n#average_karma (1, 2)"
  p User.find_by_id(1).average_karma  
  p sean.average_karma
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
  
  puts "\n#followers"
  p best_question.followers
  
  puts "\n#likers"
  p best_question.likers
  
  puts "\n#num_likes"
  p best_question.num_likes
  
  puts "\n::most_liked(1)"
  p Question::most_liked(1)
end

def replies_testing
  puts "== replies testing =="
  
  puts "\nfind by question id"
  p Reply.find_by_question_id(1)
  
  puts "\nfind by user id"
  temp = Reply.find_by_user_id(2)
  p temp
  
  puts "\n#author"
  p temp.first.author
  
  puts "\n#question"
  p temp.first.question
  
  puts "\n#parent_reply"
  p temp.first.parent_reply
  
  puts "\n#child_replies"
  p temp.first.parent_reply.child_replies
end

def followers_testing
  puts "== followers testing =="
  
  puts "\n followers, Q1"
  p QuestionFollower.followers_for_question_id(1)
  
  puts "\n Q followed, user 2"
  p QuestionFollower.followed_questions_for_user_id(2)
  
  puts "\n\n-- hard questions --"
  
  puts "\n::most_followed_questions(1)"
  p QuestionFollower.most_followed_questions(1)
end

def question_like_testing
  puts "== question_like testing =="
  
  puts "\n likers_for_question_id(1)"
  p QuestionLike.likers_for_question_id(1)
  
  puts "\nnum_likes_for_question_id(1)"
  p QuestionLike.num_likes_for_question_id(1)
  
  puts "\n::liked_questions_for_user_id(2)"
  p QuestionLike.liked_questions_for_user_id(2)

  puts "\n::most_liked(2) - note, only 1 Q has any likes"
  p QuestionLike.most_liked_questions(2)
end

user_testing
# puts "\n\n"
# question_testing
# puts "\n\n"
# replies_testing
# puts "\n\n"
# followers_testing
# puts "\n\n"
# question_like_testing