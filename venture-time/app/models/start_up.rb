class StartUp < ApplicationRecord
  has_many :start_up_investors
  has_many :investors, through: :start_up_investors
end
