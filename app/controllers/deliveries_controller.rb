class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("description")
    the_delivery.expected_on = params.fetch("expected_on")
    the_delivery.details = params.fetch("details")
    the_delivery.user = params.fetch("user")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/users/home/#{the_delivery.user}", { :notice => "Delivery created successfully." })
    else
      redirect_to("/users/home/#{the_delivery.user}", { :alert => "Invalid delivery info!" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.description = params.fetch("query_description")
    the_delivery.expected_on = params.fetch("query_expected_on")
    the_delivery.details = params.fetch("query_details")
    the_delivery.user = params.fetch("query_user")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries/#{the_delivery.id}", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
