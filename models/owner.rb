require_relative('../db/sql_runner.rb')
class Owner
  attr_reader :id,:animal_id
  attr_accessor :first_name,:last_name,:email
  def initialize(options)
    @id = nil || options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
   
    @animal_id = options['animal_id'].to_i
     
  end

  def save()
    sql = "INSERT INTO owners (first_name,last_name,email,animal_id) VALUES('#{@first_name}','#{@last_name}','#{@email}',#{@animal_id}) RETURNING *"
    owners = SqlRunner.run(sql)
    @id = owners.first()['id'].to_i
  end

  def update
    sql = "UPDATE owners SET (first_name,last_name,email,animal_id) = ('#{@first_name}','#{@last_name}','#{@email}',#{@animal_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all
   sql = "SELECT * FROM owners"
   owners =  SqlRunner.run(sql)
   @all_owners = owners.map{|owner| Owner.new(owner)}
     return @all_owners
  end
  def self.delete_all
    sql = "DELETE * FROM owners"
    all_people = SqlRunner.run(sql)
  end
  def 

  end
  end


