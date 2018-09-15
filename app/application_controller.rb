require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

   configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
   end

   get '/' do
    # if logged_in?
    #   redirect to '/tweets'
    # else
      erb :index
    # end
   end
