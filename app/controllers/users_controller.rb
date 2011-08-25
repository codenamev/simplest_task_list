class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  # TODO: User management
  # def index
  #     @users = User.all
  # 
  #     respond_to do |format|
  #       format.html # index.html.erb
  #       format.json { render json: @users }
  #     end
  #   end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if user_exists?(@user)
        @current_user = User.find_by_email(@user.email)
        cookies.permanent[:auth_token] = @current_user.auth_token
        user_may_be_different = (@current_user.last_ip != request.remote_ip)
        @current_user.last_ip = request.remote_ip
        @current_user.save!
        login_message = "You've already signed up, so we signed you in!"
        login_message << "  We also notice you've logged in from a different location.  We don't care, but you might ;-]" if user_may_be_different
        format.html { redirect_to user_path(@current_user), notice: "#{login_message}" }
      elsif @user.save
        format.html { redirect_to user_tasks_path(@user), notice: 'Signed up!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  private
  
    def user_exists?(user)
       User.find_by_email(user.email).present?
    end
  
end
