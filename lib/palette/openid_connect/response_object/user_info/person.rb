module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Person < ::OpenIDConnect::ConnectObject
          attr_optional :identity_code
          validate :require_at_least_one_attributes
        end
      end
    end
  end
end
