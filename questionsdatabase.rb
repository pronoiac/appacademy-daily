require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    
    self.results_as_hash = true
    self.type_translation = true
  end
end