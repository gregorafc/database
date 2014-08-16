class Database
  include Enumerable

  def initialize(database_path)
    @database = Hash.new
    @database_path = database_path
    Dir.entries('testdir').sort[2..-1].each { |key| @database[key.to_sym] = File.read("#{@database_path}/#{key}")}
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

  def set(file_name, content)
    @database[file_name.to_sym] = content
    File.open(file_name, 'w') { |file| file.write(content)}
  end

  def []=(file_name, content)
    @database[file_name.to_sym] = content
    File.open(file_name, 'w') { |file| file.write(content)}
  end
 
end


db = Database.new("testdir")

p db.keys
p db.get("1.txt")
p db["1.txt"]
db["secret.txt"] = "Facebook password"
p db["secret.txt"]


