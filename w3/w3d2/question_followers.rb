class QuestionFollower
  def self.followers_for_question_id(question_id)
    query = <<-SQL
      SELECT
          users.*
      FROM
          question_followers
      JOIN
          users
      ON
          question_followers.user_id = users.id
      WHERE
          question_id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, question_id)
    results.map do |result|
      User.new(result)
    end
  end
  
  def self.followed_questions_for_user_id(user_id)
    query = <<-SQL
      SELECT
          questions.*
      FROM
          question_followers
      JOIN
          questions
      ON
          question_followers.question_id = questions.id
      WHERE
          user_id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, user_id)
    results.map do |result|
      Question.new(result)
    end
  end
  
  def self.most_followed_questions(n)
    query = <<-SQL
      SELECT
          questions.*
      FROM
          question_followers
      JOIN
          questions
      ON
          question_followers.question_id = questions.id
      GROUP BY
          question_followers.question_id
      ORDER BY
          COUNT(question_id) DESC
    SQL
    results = QuestionsDatabase.instance.execute(query)
    results[0...n].map do |result|
      Question.new(result)
    end
  end
end