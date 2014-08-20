require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_followers'
require_relative 'question_likes'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    
    self.results_as_hash = true
    self.type_translation = true
  end
end