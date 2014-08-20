class QuestionLike
  def self.likers_for_question_id(question_id)
    query = <<-SQL
      SELECT
          users.*
      FROM
          question_likes
      JOIN
          users
      ON
          question_likes.user_id = users.id
      WHERE
          question_likes.question_id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, question_id)
    results.map do |result|
      User.new(result)
    end    
  end
  
  def self.num_likes_for_question_id(question_id)
    query = <<-SQL
      SELECT
          COUNT (*) AS num
      FROM
          question_likes
      WHERE
          question_id = (?)
      SQL
    result = QuestionsDatabase.instance.execute(query, question_id)
    result.first["num"] # this makes us giggle in its ugliness. like a pug.
  end
  
  def self.liked_questions_for_user_id(user_id)
    query = <<-SQL
      SELECT
          questions.*
      FROM
          question_likes
      JOIN
          questions
      ON
          question_likes.question_id = questions.id
      WHERE
          question_likes.user_id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, user_id)
    results.map do |result|
      Question.new(result)
    end
  end
  
  def self.most_liked_questions(n)
    query = <<-SQL
      SELECT
          questions.*
      FROM
          question_likes
      JOIN
          questions
      ON
          question_likes.question_id = questions.id
      GROUP BY
          question_likes.question_id
      ORDER BY
          COUNT(question_id) DESC
    SQL
    results = QuestionsDatabase.instance.execute(query)
    results[0...n].map do |result|
      Question.new(result)
    end
  end
  
end