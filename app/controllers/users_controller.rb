class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy, :activate , :activated_user] 

 respond_to :html, :js

  def index
    @users = User.paginate(page: params[:page], :per_page => 5,:order => 'approved asc')
  end

  def show
    @user = User.find(params[:id])
   
  end



  def new
    @user = User.new
  end
  
  
  

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
  #    sign_in @user
      flash[:success] = "Thank You "
      redirect_to thankyou_path
    else
      render 'new'
    end
  end
  
  

  def edit
  end
  
  
  
  def activated_user
    #@users = User.all
     @users = User.paginate(page: params[:page], :per_page => 5, :order => 'approved desc')
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  
def activate
  
 @user = User.find(params[:id])
  @user.toggle!(:approved)  # This will toggle user status to activate
  
  if @user.approved?
   UserMailer.activation_email(@user).deliver
   flash[:success] = "User activated"
  redirect_to users_url 
  
  else
 
  flash[:notice] = "User deactivated"
  redirect_to activatedusers_path 
  end
  
end
 

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end