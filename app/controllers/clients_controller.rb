class ClientsController < ApplicationController

  def new
  @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_accounts_path(@client)
    else
      render :new
    end
  end
  
  def show
  @client = Client.find(params[:id])
  end
  
  private
  def client_params
  params.require(:client).permit(:first_name, :last_name, :gender, :email_address, :contact_number, :country)
  end
end