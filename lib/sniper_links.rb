require "sniper_links/version"

require "uri"

require "sniper_links/strategies/gmail"
require "sniper_links/strategies/outlook"
require "sniper_links/strategies/yahoo"

class SniperLinks
  class Error < StandardError; end

  def initialize(email)
    @email = email

    extract_domain
    sniper_link_strategy

    self
  end

  def sniper_link(from)
    sniper_link_strategy.sniper_link(from)
  end

  def extract_domain
    @domain = email.split("@").last
  end

  def sniper_link_strategy

    @_sniper_link_strategy ||= case domain
                               when /gmail\.com\z/
                                 SniperLinks::Strategies::GMail.new(email)
                               when /outlook\.com\z/
                                 SniperLinks::Strategies::Outlook.new(email)
                               when /(my)?yahoo\./
                                 SniperLinks::Strategies::Yahoo.new(email)
                               else
                                 raise Error, "Unsupported email domain"
                               end
  end

  private

  attr_reader :email, :domain
end
