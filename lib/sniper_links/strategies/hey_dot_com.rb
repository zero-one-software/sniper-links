class SniperLinks
  module Strategies
    class HeyDotCom
      def initialize(email)
        @email = email
      end

      def sniper_link(_from = nil)
        URI("https://app.hey.com/topics/everything")
      end

      attr_reader :email
    end
  end
end

__END__

https://app.hey.com/topics/everything
