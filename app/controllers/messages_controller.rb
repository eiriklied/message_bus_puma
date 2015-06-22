class MessagesController < ApplicationController

  def index
    @messages = Message.order(created_at: :desc)
  end

  def create
    @message = Message.create!(message_params)
    MessageBus.publish "/messages", render_to_string('prepend_message')
    render nothing: true
  end


  private

  def message_params
    params.require(:message).permit(:text)
  end

end
