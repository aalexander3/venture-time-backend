class StartUpSerializer
  include FastJsonapi::ObjectSerializer
  set_type :start_up
  attributes :id, :name, :username, :mission, :description, :field, :logo, :url, :funds_needed, :active, :investors
end
