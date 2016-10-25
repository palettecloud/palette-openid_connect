module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Company < ConnectObject
          attr_required :name, :code
        end
      end
    end
  end
end
