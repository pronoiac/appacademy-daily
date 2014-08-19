class Question
  
  attr_reader :id, :title, :body, :author_id
  
  def self.find_by_id(id)
    query = <<-SQL
      SELECT
          *
      FROM
          questions
      WHERE
          id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, id)
    
    Question.new(results.first)
  end
  
  
  def self.find_by_author_id(author_id)
    query = <<-SQL
      SELECT
          *
      FROM
          questions
      WHERE
          id = (?)
    SQL
    
    qs = QuestionsDatabase.instance.execute(query, author_id)
    qs.map do |q|
      Question.new(q)
    end
  end
  
  def initialize(options={})
    @id         = options['id']
    @title      = options['title']
    @body       = options['body']
    @author_id  = options['author_id']
  end
  
  def author
    User.find_by_id(@author_id)
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end
  
  def followers
    QuestionFollower.followers_for_question_id(@id)
  end
  
end  