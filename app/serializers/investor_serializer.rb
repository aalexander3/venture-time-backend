class InvestorSerializer
  include FastJsonapi::ObjectSerializer
  set_type :investor
  attributes :id, :name, :username, :mission, :description, :interests, :logo, :url, :funds_to_invest, :active, :start_ups

  attribute :start_up_investors do |object|
    start_up_investors = object.start_up_investors
    StartUpInvestorSerializer.new(start_up_investors)
  end

end
