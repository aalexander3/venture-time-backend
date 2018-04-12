class InvestorSerializer < ActiveModel::Serializer
  attributes :id, :name, :mission, :description, :interests, :logo, :url, :funds_to_invest, :active
  has_many :start_ups
end
