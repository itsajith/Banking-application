class Transaction < ApplicationRecord
  belongs_to :account

  TRANSACTION_TYPES = ["withdraw", "deposit"]
  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES}

  before_validation :default_transaction_number 
  after_create :balance_update

  def default_transaction_number
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end

  def balance_update
    if (transaction_type == "deposit")
      self.account.balance = self.account.balance + amount
      account.save
    elsif (self.account.balance >= amount)
      self.account.balance = self.account.balance - amount
      account.save
    else
      errors.add(:balance, "Not Enough")
    end
  end

end
