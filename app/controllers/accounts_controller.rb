class AccountsController < ApplicationController

  before_action do
    @client = Client.find params[:client_id]
  end
 
  def index
    @accounts = @client.accounts
  end

  def new
    @account = @client.accounts.new
  end

  def create
    @account = @client.accounts.new(account_params.merge(user_id:current_user.id))
    if @account.save
      redirect_to client_accounts_path
    else
      render :new
    end
  end

  def show
    @account = @client.account.find(params[:id])
  end

  private
  def account_params
    params.require(:account).permit(:account_number, :balance)
  end
end
