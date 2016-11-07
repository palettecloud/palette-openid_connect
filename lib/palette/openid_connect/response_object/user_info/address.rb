module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Address < ::OpenIDConnect::ResponseObject::UserInfo::Address
          attr_optional :location

          def location=(hash_or_location)
            @location = case hash_or_location
            when Hash
              Location.new hash_or_location
            when Location
              hash_or_location
            end
          end

        end
      end
    end
  end
end
