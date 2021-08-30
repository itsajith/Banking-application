class TransactionsController < ApplicationController

  before_action do
    @client = Client.find params[:client_id]
    @account = Account.find params[:account_id]
  end

  def index
    @transactions = @account.transactions
  end

  def new
    @transaction = @account.transactions.new
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      redirect_to client_accounts_path
    else
      render :new
    end
  end

  def show
    @transaction = @account.transaction.find(params[:id])
  end

  private
  def transaction_params
  params.require(:transaction).permit(:transaction_type, :transaction_number, :amount)
  end

end
