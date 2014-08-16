class Database
  include Enumerable

  def initialize
    @database = Hash.new
    Dir.entries('testdir').sort[2..-1].each { |key| @database[key.to_sym] = File.read("testdir/#{key}")}
  end

  def keys
    @database.keys
  end
 
end


db = Database.new

p db.keys