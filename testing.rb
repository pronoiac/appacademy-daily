require_relative "questionsdatabase"

def testing
  u = User.new
  p u.find_by_id(1)
end

testing