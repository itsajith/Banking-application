class Client < ApplicationRecord
	has_many :accounts
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
end
