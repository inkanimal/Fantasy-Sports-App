require './config/environment'
require 'pry'

class BaseballController < Sinatra::Base

   configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
   end

   get '/baseball' do
    # if logged_in?
    #   redirect to '/tweets'
    # else
      erb :b_index
    # end
   end

   get '/signup' do
    if logged_in?
     redirect to '/home'
    else
     erb :'users/signup'
    end
   end

   post "/signup" do
     if params[:username].empty? || params[:password].empty? || params[:email].empty?
      redirect  '/signup'
     else
      user = User.new(username: params["username"], email: params["email"], password: params["password"])
      if  user.save
        session[:user_id] = user.id
        redirect "/home"
      end
     end
   end


 end
