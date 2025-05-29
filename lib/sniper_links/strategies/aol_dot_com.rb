class SniperLinks
  module Strategies
    class AOLDotCom
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from = from

        URI("https://mail.aol.com/d/search/keyword=from:#{from}")
      end

      attr_reader :email, :from
    end
  end
end

__END__

https://mail.aol.com/d/search/keyword=from:me@you.com
