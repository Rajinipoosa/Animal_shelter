require_relative('../db/sql_runner.rb')

class Animal
  attr_reader :id
  attr_accessor :name, :breed,:type,:admission_date,:status,:description,:image
  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @type = options['type']
    @admission_date = options['admission_date']
    @status = options['status']
    @description = options['description']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO animals (name,breed,type,admission_date,status,description,image) VALUES('#{@name}','#{@breed}','#{@type}','#{@admission_date}','#{@status}','#{@description}','#{@image}') RETURNING *"
    animals = SqlRunner.run(sql)
    @id = animals.first()['id'].to_i
  end

  def update()
    sql = "UPDATE  animals SET( name,breed,type,admission_date,status,description,image) = ('#{@name}','#{@breed}','#{@type}','#{@admission_date}','#{@status}','#{@description}','#{@image}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    @all_animals = animals.map{|animal| Animal.new(animal)}
    return @all_animals
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
  

end