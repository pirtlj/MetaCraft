class EventController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    @message_count = 0
  end
  
  def connected
    logger.info "EventController connected the request..."
  end
  
end
