

class User
  def initialize(options={})
    @id    = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def find_by_id(id)
    query = <<-SQL
      SELECT
          *
      FROM
          users
      WHERE
          id = (?)
    SQL
    results = QuestionsDatabase.instance.execute(query, id)
    
    # results.map { |result| User.new(result) }
    User.new(results.first)
  end
end

