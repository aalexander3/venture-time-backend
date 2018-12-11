class StartUpInvestorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :messages

  attribute :start_up do |object|
    object.start_up.format_json
  end

  attribute :investor do |object|
    object.investor.format_json
  end
end
