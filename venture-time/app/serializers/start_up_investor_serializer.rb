class StartUpInvestorSerializer < ActiveModel::Serializer
  attributes :id, :start_up, :investor, :messages
  has_many :messages
  belongs_to :start_up
  belongs_to :investor
end
