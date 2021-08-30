class Account < ApplicationRecord
  belongs_to :client
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true
  validates :client, presence: true
  has_many :transactions
  
  before_validation :default_balance

  def default_balance
    if self.new_record?
      self.account_number = rand(99999999)
    end
  end

  def update_balance(balance)
    self.balance = balance
    save
  end

end
