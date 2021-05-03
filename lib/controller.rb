require 'gossip'

class ApplicationController < Sinatra::Base
  attr_accessor :index

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
   
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    @id = params[:id].to_i
    @gossip = Gossip.find(@id)
    erb :gossips
  end

  get '/gossips/:id/edit/' do
    @index = params[:id].to_i 
    @gossip = Gossip.find(@index)
    erb :edit
  end

  post '/gossips/:id/edit/' do
    @index = params[:id].to_i 
    @updated_author = params["gossip_author"]
    @updated_content = params["gossip_content"]
    Gossip.update(@index, @updated_author, @updated_content)
    redirect '/'
  end

end
