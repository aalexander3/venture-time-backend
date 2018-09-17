module Api
  module V1

    class MessagesController < ApplicationController

      def create
         message = Message.new(message_params)
         conversation = StartUpInvestor.find(message_params[:start_up_investor_id])
         if message.save
           serialized_data = ActiveModelSerializers::Adapter::Json.new(
             MessageSerializer.new(message)
           ).serializable_hash
           MessagesChannel.broadcast_to conversation, serialized_data
           head :ok
         end
       end

       private

       def message_params
         params.require(:message).permit(:username, :message_body, :start_up_investor_id)
       end

    end
  end
end
