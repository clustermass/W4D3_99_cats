class SessionsController < ApplicationController 
  
  def new 
    render :new
  end 
  
  
  
  def create 
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    
    if @user != nil
      token = @user.reset_session_token!
      session[:session_token] = token 
      redirect_to :cats
    else 
      render :new 
    end 
  end   
  
  def destroy
    current_user.reset_session_token!
    
    session[:session_token] = nil
    redirect_to :cats
    
  end    
  
end 