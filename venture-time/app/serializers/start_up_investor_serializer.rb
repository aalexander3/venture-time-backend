class StartUpInvestorSerializer < ActiveModel::Serializer
  attributes :id, :start_up, :investor
  belongs_to :start_up
  belongs_to :investor
end
