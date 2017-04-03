require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )

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

erb(:"animals/new")
end

post '/animals' do 
  # binding.pry
 @animals = Animal.new(params)
 @animals.save()
 redirect '/animals'
  end


