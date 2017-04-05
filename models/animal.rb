require_relative('../db/sql_runner.rb')

class Animal
  attr_reader :id
  attr_accessor :name, :breed,:type,:admission_date,:status,:description,:image,:training
  def initialize(options)
    @id =  options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @type = options['type'].to_i
    @admission_date = options['admission_date']
    @status = options['status']
    @description = options['description']
    @image = options['image']
    @training = options['training']
  end

  def save()
    sql = "INSERT INTO animals (name,breed,type,admission_date,status,description,image,training) VALUES('#{@name}','#{@breed}','#{@type}','#{@admission_date}','#{@status}','#{@description}','#{@image}','#{@training}') RETURNING *"
    animals = SqlRunner.run(sql)
    @id = animals.first()['id'].to_i
  end

  def update()
    sql = "UPDATE  animals SET( name,breed,type,admission_date,status,description,image,training) = ('#{@name}','#{@breed}','#{@type}','#{@admission_date}','#{@status}','#{@description}','#{@image}','#{@training}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
   sql = "DELETE FROM animals where id = #{@id}"
   SqlRunner.run(sql)
 end


 def self.all
  sql = "SELECT * FROM animals"
  animals = SqlRunner.run(sql)
  @all_animals = animals.map{ |animal| Animal.new(animal) }
  return @all_animals
end
def self.adoptables()
  sql = "SELECT * FROM animals WHERE status = 't'"
  animals = SqlRunner.run(sql)
  @adoptable_animals = animals.map{ |animal| Animal.new(animal) }
  return @adoptable_animals

end

def self.find(id)
  sql = "SELECT * FROM animals WHERE id = #{id}"

  animals = SqlRunner.run(sql)
  return Animal.new(animals.first)
end

def self.delete_all
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)

end

def self.find_type(type_id)
    sql = "SELECT * FROM animals WHERE type = #{type_id}"
    animals = SqlRunner.run(sql)
    
  result= animals.map{ |animal| Animal.new(animal) }
  
    return result
end

end