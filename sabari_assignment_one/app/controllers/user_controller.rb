class UserController < ApplicationController
   
  def login
  	
  end
  
  def validate_user
	   @user = User.where(:email => params["email"], :password => params["password"])
	   if @user.present?
	   	    $login_user = params["email"]
	   	    return redirect_to "/friends/home"

	   else
	   	    return redirect_to "/"
	   end
  end

  def user_sign_up

  

  end

  def update_new_user
  	
    new_user = User.new
    new_user.email = params["email"]
    new_user.name = params["name"] 
    new_user.password = params["password"]
    if (new_user.save)
    	$login_user = params["email"]
    end
    return redirect_to "/friends/home"
  end

end
