class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  use Rack::MethodOverride
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
  get '/recipes/:id/edit'
    @article = Article.find_by_id(params[:id])
    erb :edit
  end
  patch '/recipes/:id'
  get '/recipes'
end