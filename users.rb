

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
    query = <<-SQL
      SELECT
          *
      FROM
          questions
      WHERE
          author_id = (?)
    SQL
    
    QuestionsDatabase.instance.execute(query, @id)    
  end
  
  def authored_replies
    query = <<-SQL
      SELECT
          *
      FROM
          replies
      WHERE
          author_id = (?)
    SQL
  
    QuestionsDatabase.instance.execute(query, @id)    
  end
  
  
    
end

