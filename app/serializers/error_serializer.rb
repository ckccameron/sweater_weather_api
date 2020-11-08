class ErrorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status_code, :message
end
