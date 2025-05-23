class SniperLinks
  module Strategies
    class Outlook
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from = from

        URI("https://outlook.live.com/mail/?login_hint=#{encode(from)}")
      end

      private

      def encode(str)
        URI.encode_www_form_component(str)
      end

      attr_reader :email, :from
    end
  end
end

__END__

https://outlook.live.com/mail/?login_hint=encoded_email}
