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

  def find(file_name)
    file = []
    keys.each do |key|
      if key.to_s.include? file_name
        file << key
      end
    end
    file 
  end

  def [](file_name)

      files = find(file_name)

      if files.size == 0
        return "Non existing file"
      elsif files.size == 1
        return @database[files[0]]
      else
        return "Pasujące pliki #{files}"
      end
  end

  def set(file_name, content)
    @database[file_name.to_sym] = content
    File.open("#{@database_path}/#{file_name}", 'w') { |file| file.write(content)}
  end

  def []=(file_name, content)
    @database[file_name.to_sym] = content
    File.open("#{@database_path}/#{file_name}", 'w') { |file| file.write(content)}
  end
 
end


db = Database.new("testdir")

p db["1.txt"]
#db["secret.txt"] = "Facebook password"
#p db["secret.txt"]
#p db["4.txt"]
p db["test"]









