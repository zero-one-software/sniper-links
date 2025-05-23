class SniperLinks
  module Strategies
    class GMail
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from = from

        sniper_filter = encode(filter)

        URI("https://mail.google.com/mail/u/0/#search/#{sniper_filter}")
      end

      private

      def filter
        "from:(#{from}) in:anywhere newer_than:1h"
      end

      def encode(str)
        URI.encode_www_form_component(str)
      end


      attr_reader :email, :from
    end
  end
end

__END__

https://mail.google.com/mail/u/0/#search/from%3A(user%40some.domain)+in%3Aanywhere+newer_than%3A1h
