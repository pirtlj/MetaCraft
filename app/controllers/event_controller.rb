class EventController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    @message_count = 0
  end

  def connected
    logger.info "EventController connected the request..."
  end

  def test
    logger.info "EventController test event...#{message} #{current_user}"
    trigger_success(message: "test successful #{current_user.email}")
    
  end
end
