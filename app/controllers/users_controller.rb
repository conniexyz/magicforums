class UsersController<ApplicationController
 
 def new
  @user = User.new
 end

 def edit
  @user = User.find_by(id: params[:id])
 end
 
 def create
      #TODO: implement user creation
      @user = User.new(user_params)
      # binding.pry

    if @user.save
       flash[:success] = "You've Successful Register."
      redirect_to root_path
    else
       flash[:danger] = @user.errors.full_messages
      redirect_to new_user_path
      #  render new_user_path
    end
 end

 def update
  # binding.pry
    @update = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:success] = "You've updated."
      redirect_to users_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
 end
 
 private
 
 def user_params
  params.require(:user).permit(:email, :username, :password)
 end
end