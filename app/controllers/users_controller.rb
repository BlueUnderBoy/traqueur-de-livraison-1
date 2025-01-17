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
      emails.push(x["email"])
    end
    if emails.include?(the_email)
      the_user = User.where( :email => the_email)
      pass = the_user.password
      if pass == the_pw
        @user = the_user
        render({ :template => "home"})
      else 
        redirect_to("/users/loreg", alert: "The email or password was wrong!" )
      end
    else 
      redirect_to("/users/loreg", alert: "The email or password was wrong!" )
    end
      #@list_of_users = matching_users.order({ :created_at => :desc })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def create
    the_user = User.new
    the_user.email = params.fetch("email")
    the_user.password = params.fetch("password")

    if the_user.valid? && the_user.email.presence? && the_user.password.presence?
      the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users/sign_up", { :alert => the_user.errors.full_messages.to_sentence })
    end
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
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end
end
