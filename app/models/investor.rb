class Investor < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_secure_password

  has_many :start_up_investors
  has_many :start_ups, through: :start_up_investors
end
