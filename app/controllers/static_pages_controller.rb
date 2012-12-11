class StaticPagesController < ApplicationController
  
  
  def home
    if signed_in?
       flash[:success] = "Welcome "
    end
  end
  

  def help
  end
  
  def about
  end
  
  def contact    
  end
  
  def thankyou
    
  end
  
end
