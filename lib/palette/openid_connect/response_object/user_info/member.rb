module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo
        class Member < ::OpenIDConnect::ConnectObject
          attr_required :company
          attr_optional :cluboff_id
          attr_optional :tenant
          attr_optional :contractor
          validate :require_at_least_one_attributes

          def company=(hash_or_company)
            @company = case hash_or_company
            when Hash
              Company.new hash_or_company
            when Company
              hash_or_company
            end
          end

          def tenant=(hash_or_tenant)
            @tenant = case hash_or_tenant
            when Hash
              Tenant.new hash_or_tenant
            when Tenant
              hash_or_tenant
            end
          end

          def contractor=(hash_or_contractor)
            @contractor = case hash_or_contractor
            when Hash
              Contractor.new hash_or_contractor
            when Contractor
              hash_or_contractor
            end
          end

        end
      end
    end
  end
end
