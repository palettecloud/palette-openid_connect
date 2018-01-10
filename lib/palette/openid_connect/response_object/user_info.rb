require 'palette/openid_connect/response_object/monkey/user_info'

module Palette
  module OpenIDConnect
    class ResponseObject
      class UserInfo < ::OpenIDConnect::ResponseObject::UserInfo
        attr_optional(
          :name_kana,
          :family_name_kana,
          :given_name_kana,
          :members,
          :palette_id,
        )

        # NOTE because AttrOptional overrides
        #      address= definition in OpenIDConnect::ResponseObject::UserInfo
        def address=(hash_or_address)
          @address = case hash_or_address
          when Hash
            Address.new hash_or_address
          when Address
            hash_or_address
          end
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

        def members
          @members || []
        end

        private
          def non_string_attributes
            super | [:members]
          end
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/user_info/*.rb'].each do |file|
  require file
end
