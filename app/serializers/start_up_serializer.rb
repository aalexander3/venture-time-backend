class StartUpSerializer
  include FastJsonapi::ObjectSerializer
  set_type :start_up
  attributes :id, :name, :username, :mission, :description, :field, :logo, :url, :funds_needed, :active, :investors

  attribute :start_up_investors do |object|
    start_up_investors = object.start_up_investors
    StartUpInvestorSerializer.new(start_up_investors)
  end
end
