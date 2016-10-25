module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Address < ::OpenIDConnect::ResponseObject::UserInfo::Address
          attr_optional :location
        end
      end
    end
  end
end
