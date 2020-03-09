class Dog

  attr_accessor :name, :breed, :id

  def initialize (name:, breed:, id:nil)
    @name = name
    @breed = breed
    @id = id
  end
  
  def self.create_table
    sql = <<-SQL
     CREATE TABLE IF NOT EXISTS dogs (
       id INTEGER PRIMARY KEY,
       name TEXT,
       breed TEXT
       )
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
    
    DROP TABLE dogs
    
    SQL
    
    DB[:conn].execute(sql)
  end

  def save
 if self.id
   self.update
 else
   sql = <<-SQL
     INSERT INTO songs (name, album)
     VALUES (?, ?)
   SQL
   DB[:conn].execute(sql, self.name, self.album)
   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
 end
end




end