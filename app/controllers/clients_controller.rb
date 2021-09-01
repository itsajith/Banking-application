class ClientsController < ApplicationController

  before_action :set_user, only: %i[edit show update]
  before_action :authenticate_user!
 
  def new
    @client = current_user.clients.new
  end
  
  def create
      @client = current_user.clients.new(client_params)
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
  def set_user
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :gender, :email_address, :contact_number, :country)
  end
end