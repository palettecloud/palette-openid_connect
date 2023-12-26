module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Contractor < ::OpenIDConnect::ConnectObject
          # TODO future
          # attr_optional :contracts
          attr_optional :identity_code
          validate :require_at_least_one_attributes

          # def contracts=(array_of_hash_or_contracts)
          #   return nil if array_of_hash_or_contracts.nil?
          #
          #   @contracts = array_of_hash_or_contracts.map do |hash_or_contract|
          #     case hash_or_contract
          #     when Hash
          #       Contract.new hash_or_contract
          #     when Contract
          #       hash_or_contract
          #     end
          #   end
          # end

        end
      end
    end
  end
end
