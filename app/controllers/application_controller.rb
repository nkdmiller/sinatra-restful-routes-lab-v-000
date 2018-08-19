class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes/new'
    erb :new
  end
  post '/recipes'
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  get '/recipes/:id'
    @recipe = Recipe.find_by(params[:id])
    erb :show
  end
  
end