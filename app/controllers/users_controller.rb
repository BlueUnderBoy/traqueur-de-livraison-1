class UsersController < ApplicationController
  def loreg
    render({ :template => "users/loreg" })
  end

  def sup
    render({ :template => "users/sign_up"})
  end

  def validate
    the_email = params.fetch("email")
    the_pw = params.fetch("password")
    emails = []
    all_users = User.all
    all_users.each do |x|
      emails.push(x.email)
    end
    if emails.include?(the_email)
      the_user = User.where( :email => the_email)
      upw = the_user.at(0).password
      if the_pw == upw 
        @user = the_user
        @uid = the_user.at(0).id
        Rails.logger.info("Variable from validate " + @uid.to_s)
        redirect_to("/users/home/#{@uid}", notice: "Login successful")
      else 
        redirect_to("/users/loreg", alert: "The email or password was wrong!" )
      end
    else
      redirect_to("/users/loreg", alert: "The email or password was wrong!" )
    end
      #@list_of_users = matching_users.order({ :created_at => :desc })
  end

  def index
    render({ :template => "/users/home"})
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def create
    emails = []
    all_users = User.all
    all_users.each do |x|
      emails.push(x["email"])
      end
    the_user = User.new
    the_user.email = params.fetch("email")
    the_user.password = params.fetch("password")
    pc = params.fetch("pc")
    
    if emails.include?(the_user.email)
      redirect_to("/users/sign_up", alert: "That email is already registered!" )
    else
      if the_user.valid?
        if the_user.password == pc
          the_user.save
          @user = the_user.id
          @uid = the_user.id
          redirect_to("/users/home/#{@uid}", notice: "User created successfully.")
        else 
          redirect_to("/users/sign_up", alert: "The passwords do not match!" )
        end
      else
        redirect_to("/users/sign_up", alert: "Invalid user" )
      end
    end
  end

  def exit 
    redirect_to("/", notice: "Logout successful")
  end

  def edit
    render({ :template => "/users/edit"})
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.email = params.fetch("email")
    the_user.password = params.fetch("password")

    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.id}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("uid")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/", { :notice => "User deleted successfully."} )
  end
end
