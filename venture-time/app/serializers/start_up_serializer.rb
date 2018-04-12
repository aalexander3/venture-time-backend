class StartUpSerializer < ActiveModel::Serializer
  attributes :id, :name, :mission, :description, :field, :logo, :url, :funds_needed, :active
  has_many :investors
end
