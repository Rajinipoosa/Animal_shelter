require_relative('../models/animals.rb')
require_relative('../models/owner.rb')

require('pry')

 Animal.delete_all

animal1 = Animal.new({
    "name" => "Julie",
    "type"=> "cat",
    "breed"=> "American short hair",
    "admission_date" => "March 27 2017",
     "status"=> TRUE,
     "description" => "The adaptable and good-natured American Shorthair retains his hunting ability, but these days he is more likely to be a family companion.See all American Shorthair characteristics below!",
         "image" => '../public/images/american short.jpg' })
animal1.save()

animal2 = Animal.new({
    "name" => "Pepsy",
    "type"=> "dog",
    "breed"=> "Bichon Frise",
    "admission_date" => "March 16 2017",
     "status"=> FALSE,
     "description" => "The Bichon Frise (pronounced BEE-shawn FREE-say; the plural is Bichons Frises) is a cheerful, small dog breed with a love of mischief and a lot of love to give. With his black eyes and fluffy white coat, the Bichon looks almost like a child’s toy. And it doesn’t take long to realize that the Bichon can be your happiest and most enthusiastic companion",
         "image" => '../public/images/puppy.jpg' })
animal2.save()
 owner1 = Owner.new({
  "first_name" => "Rajini",
  "last_name" => "Poosa",
   "email" => "rajinipoosa@gmail.com",
   
   "animal_id" => animal1.id
   })
owner1.save()


binding.pry
nil