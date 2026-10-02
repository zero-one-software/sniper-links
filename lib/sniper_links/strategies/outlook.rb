class SniperLinks
  module Strategies
    class Outlook
      def initialize(email)
        @email = email
      end

      def sniper_link(_from = nil)
        URI("https://outlook.live.com/mail/?login_hint=#{encode(email)}")
      end

      private

      def encode(str)
        URI.encode_www_form_component(str)
      end

      attr_reader :email
    end
  end
end

__END__

https://outlook.live.com/mail/?login_hint=user%40outlook.com
