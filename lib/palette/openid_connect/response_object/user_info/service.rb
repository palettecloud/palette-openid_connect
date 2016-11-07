module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Service < ::OpenIDConnect::ConnectObject
          attr_required :name, :uid
        end
      end
    end
  end
end
