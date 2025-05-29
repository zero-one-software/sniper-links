class SniperLinks
  module Strategies
    class MailDotRu
      def initialize(email)
        @email = email
      end

      def sniper_link(from)
        @from = from

        URI("https://e.mail.ru/search?q_from=#{from}")
      end

      attr_reader :email, :from
    end
  end
end

__END__

https://e.mail.ru/search/?q_from=me@you.com
