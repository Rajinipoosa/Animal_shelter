require_relative('../db/sql_runner.rb')

class Owner
  attr_reader :id
  attr_accessor :first_name,:last_name,:email
  def initialize(options)
    @id =  options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO owners (first_name,last_name,email) VALUES('#{@first_name}','#{@last_name}','#{@email}') RETURNING *"
    owners = SqlRunner.run(sql)
    @id = owners.first()['id'].to_i
  end

  def update
    sql = "UPDATE owners SET (first_name,last_name,email) = ('#{@first_name}','#{@last_name}','#{@email}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def adopt(id)
    sql = "INSERT INTO adoptions(animal_id,owner_id) VALUES(#{id},#{@id}) RETURNING *"
    adoptions = SqlRunner.run(sql).first()
    return adoptions
  end

  def animals()
    sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON animals.id = adoptions.animal_id WHERE adoptions.owner_id =  #{@id}"

    animals = SqlRunner.run(sql)
    @animals = animals.map{ |animal| Animal.new(animal) }
    return @animals
  end

  def delete()
    sql = "DELETE FROM owners where id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM owners"
    owners =  SqlRunner.run(sql)
    @all_owners = owners.map{ |owner| Owner.new(owner) }
    return @all_owners
  end
  def self.delete_all
   sql = "DELETE  FROM owners"
   SqlRunner.run(sql)
 end

 def self.find(id)
   sql = "SELECT * FROM owners WHERE id = #{id}"
   owners = SqlRunner.run(sql)
   return Owner.new(owners.first)
 end
end


