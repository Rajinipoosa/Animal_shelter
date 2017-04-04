require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
require_relative('../models/type.rb')

require('pry')

Adoption.delete_all
Owner.delete_all
Animal.delete_all
Type.delete_all

# type object
# type.new 
# type.save
# type.all
type1 = Type.new({"name" => "cat"})
type2 =  Type.new({"name" => "dog"})
type1.save
type2.save
  
animal1 = Animal.new({
    "name" => "Julie",
    "type"=> type1.id,
    "breed"=> "American short hair",
    "admission_date" => "March 27 2017",
     "status"=> true,
     "description" => "The adaptable and good-natured American Shorthair retains his hunting ability, but these days he is more likely to be a family companion.See all American Shorthair characteristics below",
         "image" => '/images/americanshort.jpg',
         "training" => false })
animal1.save()

animal2 = Animal.new({
    "name" => "Pepsy",
    "type"=> type2.id,
    "breed"=> "Bichon Frise",
    "admission_date" => "March 16 2017",
     "status"=> false,
     "description" => "The Bichon Frise pronounced BEE-shawn FREE-say the plural is Bichons Frises is a cheerful, small dog breed with a love of mischief and a lot of love to give. With his black eyes and fluffy white coat, the Bichon looks almost like a child’s toy. And it doesn’t take long to realize that the Bichon can be your happiest and most enthusiastic companion",
         "image" => '/images/puppy.jpg',
         "training" => true })
animal2.save()

 owner1 = Owner.new({
  "first_name" => "Rajini",
  "last_name" => "Poosa",
   "email" => "rajinipoosa@gmail.com"})
owner1.save()
 owner2 = Owner.new({
  "first_name" => "satish",
  "last_name" => "kura",
   "email" => "satish.kura@gmail.com"})
owner1.save()
owner2.save()
owner1.adopt(animal1.id) 
@animal = Animal.find(animal1.id)

@animal.status = "f"

@animal.update()

binding.pry
nil