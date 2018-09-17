class StartUpInvestor < ApplicationRecord
  belongs_to :start_up
  belongs_to :investor
  has_many :messages
end
