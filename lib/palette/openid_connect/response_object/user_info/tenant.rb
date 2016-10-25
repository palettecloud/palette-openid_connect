module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Tenant < ::OpenIDConnect::ConnectObject
          attr_required :company
          attr_optional :labels
          validate :require_at_least_one_attributes

          def company=(hash_or_company)
            @company = case hash_or_company
            when Hash
              Company.new hash_or_company
            when Company
              hash_or_company
            end
          end

          def labels=(array_or_string)
            @labels = case array_or_string
            when Array
              array_or_string
            when String
              [array_or_string]
            end
          end
        end
      end
    end
  end
end
