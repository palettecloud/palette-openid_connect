module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Location < ::OpenIDConnect::ConnectObject
          attr_required :longitude, :latitude

          def to_h
            {
              longitude: longitude,
              latitude: latitude,
            }
          end
        end
      end
    end
  end
end
