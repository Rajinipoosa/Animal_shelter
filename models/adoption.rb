require_relative('../db/sql_runner.rb')
class Adoption
  attr_reader :id
  attr_accessor :animal_id, :owner_id
  def initialize(options)
   @id = nil || options['id'].to_i
   @animal_id = options['animal_id'].to_i
   @owner_id = options['owner_id'].to_i

  end
 def save()
   sql = "INSERT INTO adoptions(animal_id,owner_id) VALUES(#{@animal_id},#{@owner_id}) RETURNING *"
   adoptions = SqlRunner.run(sql)
   @id = adoptions.first()['id'].to_i

 end
 def update()
   sql = "UDATE FROM adoptions SET(animal_id,owner_id) = (#{@animal_id},#{@owner_id})"
   SqlRunner.run( sql )

 end

def self.all()

  sql = "SELECT * FROM adoptions"
  adoptions = SqlRunner.run(sql)
  @all_adoptions = adoptions.map{|adoption| Adoption.new(adoption)}
  return @all_adoptions
end

def self.delete_all
  sql = "DELETE FROM adoptions"
  SqlRunner.run( sql )
end

def self.find(owner_id)
 sql = "SELECT * FROM adoptions where owner_id = #{id}"
 adoptions = SqlRunner.run(sql)
 return Adoption.new(adoptions)
end



end