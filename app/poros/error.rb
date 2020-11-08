class Error
  attr_reader :id,
              :status_code

  def initialize(error_message)
    @error_message = error_message
    @status_code = 400
  end

  def message
    @error_message
  end
end
