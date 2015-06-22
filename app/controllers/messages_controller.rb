class MessagesController < ApplicationController

  def index
    @messages = Message.order(created_at: :desc)
  end

  def create
    @message = Message.create!(message_params)
    render nothing: true
  end


  private

  def message_params
    params.require(:message).permit(:text)
  end

end
