class SniperLinks
  module Strategies
    class GMail
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from = from

        sniper_filter = encode(filter)

        # Gmail rejects /mail/u/<email>/ with a search fragment ("Temporary Error") since April 2026
        URI("https://mail.google.com/mail/?authuser=#{encode(email)}#search/#{sniper_filter}")
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

https://mail.google.com/mail/?authuser=user%40gmail.com#search/from%3A(user%40some.domain)+in%3Aanywhere+newer_than%3A1h
