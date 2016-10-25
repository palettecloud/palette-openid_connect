module Palette
  module OpenIDConnect
    class ResponseObject < ResponseObject
    end
  end
end

Dir[File.dirname(__FILE__) + '/response_object/*.rb'].each do |file|
  require file
end
