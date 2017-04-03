require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )


get '/owners' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb ( :"owners/index" )
end

get '/owners/:id/adopt' do
  @owner = Owner.find(params[:id])
  @animals = Animal.all()
  erb (:"/owners/update")
  end

  post '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update
   @owner.adopt(params[:animal_id])
  @animal= Animal.find(params[:animal_id])
  @animal.status = "f"
  @animal.update

   redirect '/animals'
  end