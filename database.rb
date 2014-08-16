class Database
  include Enumerable

  def initialize
    @database = Hash.new
    Dir.entries('testdir').sort[2..-1].each { |key| @database[key.to_sym] = File.read("testdir/#{key}")}
  end

  def keys
    @database.keys
  end

  def get(file_name)
    @database[file_name.to_sym]
  end

  def [](file_name)
    @database[file_name.to_sym]
  end
 
end


db = Database.new

p db.keys
p db.get("1.txt")
p db["1.txt"]