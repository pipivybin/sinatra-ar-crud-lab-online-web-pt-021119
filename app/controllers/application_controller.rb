
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

#create
  get '/articles/new' do
    erb :new #form
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

# read
  get '/articles' do
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

#update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit #form
  end

  patch '/articles/:id' do

    @article = Article.find(params[:id]) #repetitive?

    @article.update(title: params[:title], content: params[:content])

    redirect "/articles/#{@article.id}" #can i do erb :show?
  end

#delete
  delete '/articles/:id' do #does it have to add delete in the route?
    Article.delete(params[:id])
    redirect "/articles"
  end

end
