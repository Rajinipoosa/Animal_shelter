require( 'sinatra' )
require('pry')
require( 'sinatra/contrib/all' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )


get '/adoptions' do
 
  @animals = Animal.all()
  erb ( :"adoptions/adoptions" )
end

get '/training' do
 
  @animals = Animal.all()
  erb ( :"adoptions/training" )
end

get '/assign' do
  @owners = Owner.all()
  @animals = Animal.all()
  @types = Type.all()
 
  @adoptable_animals = Animal.adoptables()
  erb ( :"adoptions/assign" )
end
post '/assign' do
 @adoption = Adoption.new(params)
 @adoption.save()
  redirect "/owners" 
end
