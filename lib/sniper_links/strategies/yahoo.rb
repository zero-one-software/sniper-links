class SniperLinks
  module Strategies
    class Yahoo
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from  = from
        filter = encode(from)

        URI("https://mail.yahoo.com/d/search/keyword=from%253A#{filter}")
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

https://mail.yahoo.com/d/search/keyword=from%253Auser%40some.domain
