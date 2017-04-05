require_relative('../db/sql_runner.rb')
class Type
  attr_reader :id
  attr_accessor :name
  def initialize(options)
    @id =  options['id'].to_i
    @name = options['name']

  end
  def save()
    sql = "INSERT INTO type(name) VALUES('#{@name}') RETURNING *"
    type = SqlRunner.run(sql)
    @id = type.first()['id'].to_i
  end

  def update()
    sql = "UPDATE  type SET(name)=('#{@name}')"
    SqlRunner.run(sql)
    
  end

  def self.all()
    sql = "SELECT * FROM type"
    types = SqlRunner.run(sql)
    @all_types = types.map{ |type| Type.new(type) }
    return @all_types

  end

  def self.delete_all()
    sql = "DELETE  FROM type"
    SqlRunner.run(sql)
  end
  
  
  
 end