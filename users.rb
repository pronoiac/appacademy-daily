class User
  attr_reader :id, :fname, :lname

  def self.find_by_id(id)
    query = <<-SQL
      SELECT
          *
      FROM
          users
      WHERE
          id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, id)
    
    User.new(results.first)
  end
  
  def self.find_by_name(fname, lname)
    query = <<-SQL
      SELECT
          *
      FROM
          users
      WHERE
          fname = (?)
          AND lname = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, fname, lname)
    
    User.new(results.first)
  end

  def initialize(options={})
    @id    = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def authored_questions
    Question.find_by_author_id(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)  
  end
  
  def followed_questions
    QuestionFollower.followed_questions_for_user_id(@id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    query = <<-SQL
        SELECT
            COALESCE(total_questions / CAST(total_likes AS FLOAT), 0) AS average_karma
        FROM
            (SELECT
                COUNT(DISTINCT(questions.id)) AS total_questions,
                COUNT(question_likes.id) AS total_likes
                -- total_likes / total_questions AS average_karma
            FROM
                questions
            LEFT OUTER JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE
                questions.author_id = (?))
    SQL
    results = QuestionsDatabase.instance.execute(query, @id)
    results.first["average_karma"]
  end
  
end

