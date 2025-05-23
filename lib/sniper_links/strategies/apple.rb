class SniperLinks
  module Strategies
    class Apple
      def initialize(email)
        @email = email
      end

      def sniper_link(_from = nil)
        URI("https://www.icloud.com/mail/")
      end

      attr_reader :email
    end
  end
end

__END__

https://www.icloud.com/mail/
