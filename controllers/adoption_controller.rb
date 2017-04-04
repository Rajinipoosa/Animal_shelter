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

