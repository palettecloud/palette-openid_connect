require 'palette/openid_connect/response_object/monkey/user_info'

module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo < ::OpenIDConnect::ResponseObject::UserInfo
        attr_optional(
          :members,
          :services,
        )

        # NOTE because AttrOptional overrides
        #      address= definition in OpenIDConnect::ResponseObject::UserInfo
        def address=(hash_or_address)
          super
        end

        def members=(array_of_hash_or_members)
          return nil if array_of_hash_or_members.nil?

          @members = array_of_hash_or_members.map do |hash_or_member|
            case hash_or_member
            when Hash
              Member.new hash_or_member
            when Member
              hash_or_member
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
            super | [:members, :services]
          end
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/user_info/*.rb'].each do |file|
  require file
end
