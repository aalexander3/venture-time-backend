class StartUpInvestorsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "start_up_investors_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
