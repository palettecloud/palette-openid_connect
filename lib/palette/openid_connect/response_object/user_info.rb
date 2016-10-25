require 'palette/openid_connect/response_object/monkey/user_info'

module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo < ::OpenIDConnect::ResponseObject::UserInfo
        attr_optional(
          :tenants,
          :services,
        )

        def tenants=(array_of_hash_or_tenants)
          return nil if array_of_hash_or_tenants.nil?

          @tenants = array_of_hash_or_tenants.map do |hash_or_tenant|
            case hash_or_tenant
            when Hash
              Tenant.new hash_or_tenant
            when Tenant
              hash_or_tenant
            end
          end
        end

        def services=(array_or_string)
          @services = case array_or_string
          when Array
            array_or_string
          when String
            [array_or_string]
          end
        end

        private
          def non_string_attributes
            super | [:tenants, :services]
          end
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/user_info/*.rb'].each do |file|
  require file
end
