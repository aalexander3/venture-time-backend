class Investor < ApplicationRecord
  has_many :start_up_investors
  has_many :start_ups, through: :start_up_investors
end
