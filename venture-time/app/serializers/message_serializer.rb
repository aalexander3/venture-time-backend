class MessageSerializer < ActiveModel::Serializer
  attributes :id, :start_up_investor_id, :message_body, :created_at, :username
end
