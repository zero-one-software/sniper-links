class SniperLinks
  module Strategies
    class Proton
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from  = from
        filter = encode(from)

        URI("https://mail.proton.me/u/0/all-mail#from=#{filter}")
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

https://mail.proton.me/u/0/all-mail#from=user%40some.domain
