require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative( '../models/type.rb' )


get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

post '/animals/:id/delete' do
  @animal = Animal.find(params[:id])
  @animal.delete()
  redirect '/animals'
end

get '/animals/new' do 
 @types = Type.all()

 erb(:"animals/new")
end

post '/animals' do 
  # binding.pry
  @animals = Animal.new(params)
  @animals.save()
  redirect '/animals'
end

get '/animals/:id/edit' do
  @animals = Animal.all()
  @animal = Animal.find(params[:id])
  @types = Type.all()
  erb(:"/animals/edit")
end

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update
  redirect "/animals"
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

