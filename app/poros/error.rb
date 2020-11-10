class Error
  attr_reader :id

  def initialize(error_message)
    @error_message = error_message
  end

  def message
    @error_message
  end
end
