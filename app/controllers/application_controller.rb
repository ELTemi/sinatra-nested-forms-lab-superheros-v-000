require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = params[:team]
      @members = @team[:members]
      erb :team
    end

    configure do
      enable :sessions
      set :session_secret, "secret"
    end

    get '/hey' do
      @session = session
    end

end
