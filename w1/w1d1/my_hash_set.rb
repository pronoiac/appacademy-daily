class MyHashSet
  attr_reader :store
  
  def initialize
    @store = Hash.new(false)
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store[el]
  end
  
  def delete(el)
    temp = @store[el]
    @store.delete(el)
    temp
  end
  
  def to_a
    @store.keys
  end
  
  def union(set2)
    @store.merge(set2.store).keys
  end
  
  def intersect(set2)
    results = MyHashSet.new
    @store.each do |key, value|
      if set2.include? key
        results.insert key
      end
    end
    results
  end
  
  def minus(set2)
    results = MyHashSet.new
    @store.each do |key, value|
      unless set2.include? key
        results.insert key
      end
    end
    results
  end
  
end

# test
colas = MyHashSet.new
colas.insert "RC"
colas.insert "Tab"  
colas.insert "Nitro"

puts "Colas: #{colas.to_a}" 

puts "Includes RC and Water?"
p colas.include?("RC")
p colas.include?("water")

puts "Deleting RC and water"
p colas.delete("RC")
p colas.delete("water")

puts "Colas"
p colas.to_a


drinks = MyHashSet.new
drinks.insert "wine"
drinks.insert "beer"
drinks.insert "water"
drinks.insert "Nitro"

puts "Drinks union colas"
p drinks.union(colas)

puts "Drinks intersect colas"
p drinks.intersect(colas).to_a

puts "Drinks minus colas"
p drinks.minus(colas).to_a
