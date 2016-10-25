module OpenIDConnect
  class ResponseObject
    class UserInfo

      def initialize(attributes = {})
        super
        (all_attributes - non_string_attributes).each do |key|
          self.send "#{key}=", self.send(key).try(:to_s)
        end
        self.updated_at = updated_at.try(:to_i)
      end

      private
        # 初期化時に自動で to_s しない attribute 一覧
        def non_string_attributes
          [:email_verified, :phone_number_verified, :address, :updated_at]
        end
    end
  end
end
