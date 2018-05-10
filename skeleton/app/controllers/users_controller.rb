
class UsersController < ApplicationController 
  
  def new 
    render :new
  end 
  
  
  
  def create 

    @user = User.new(user_name: params[:user][:user_name], password: params[:user][:password])
    
    
    
     if @user.save
       token = @user.session_token
       session[:session_token] = token
       redirect_to :cats
     else
       render :new
     end 
  end   
  
end 