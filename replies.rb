class Reply
  attr_reader :id, :subject_id, :parent_id, :author_id, :body

  def self.find_by_id(id)
    query = <<-SQL
      SELECT
          *
      FROM
          replies
      WHERE
          id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, id)
    
    Reply.new(results.first)
  end

  def self.find_by_question_id(question_id)
    query = <<-SQL
      SELECT
          *
      FROM
          replies
      WHERE
          subject_id = (?)
    SQL
    QuestionsDatabase.instance.execute(query, question_id)
  end
  
  def self.find_by_user_id(user_id)
    query = <<-SQL
      SELECT
          *
      FROM
          replies
      WHERE
          author_id = (?)
    SQL
  
    results = QuestionsDatabase.instance.execute(query, user_id)
    results.map { |result| Reply.new(result) }
  end
  
  def initialize(options={})
    @id         = options['id']
    @subject_id = options['subject_id']
    @parent_id  = options['parent_id']
    @author_id  = options['author_id']
    @body       = options['body']
  end
  
  def author
    User.find_by_id(@author_id)
  end
  
  def question
    Question.find_by_id(@subject_id)
  end
  
  def parent_reply
    Reply.find_by_id(@parent_id)
  end
  
  def child_replies
    query = <<-SQL
      SELECT
          *
      FROM
          replies
      WHERE
          parent_id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, @id)
    results.map { |result| Reply.new(result) }
  end
  
end