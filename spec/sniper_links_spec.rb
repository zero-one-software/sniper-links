require 'pry'

RSpec.describe SniperLinks do
  it "has a version number" do
    expect(SniperLinks::VERSION).not_to be nil
  end

  subject(:sniper_link_obj) { SniperLinks.new(email) }

  let(:from) { "howdy@zero-one.io" }

  context "when working with GMail" do
    context "when supplied an email ending in @gmail.com" do
      let(:email) { "plop@gmail.com" }

      it "is expected to use the GMail sniper link strategy automatically" do
        expect(sniper_link_obj.sniper_link_strategy).to be_a(SniperLinks::Strategies::GMail)
      end

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it "is expected to generate a sniper link" do
          expect(strategy_obj).to be_a(URI)
        end

        it "is expected to point to the correct URL" do
          expect(strategy_obj.host).to eq "mail.google.com"
        end

        it "is expected to have sniper params" do
          expect(strategy_obj.fragment).to start_with("search/")
        end
      end
    end
  end

  context "when working with Outlook" do
    context "when supplied an email ending in @outlook.com" do
      let(:email) { "plop@outlook.com" }

      it "is expected to use the Outlook sniper link strategy automatically" do
        expect(sniper_link_obj.sniper_link_strategy).to be_a(SniperLinks::Strategies::Outlook)
      end

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it "is expected to generate a sniper link" do
          expect(strategy_obj).to be_a(URI)
        end

        it "is expected to point to the correct URL" do
          expect(strategy_obj.host).to eq "outlook.live.com"
        end

        it "is expected to have sniper params" do
          expect(strategy_obj.query).to start_with("login_hint=")
        end
      end
    end
  end
end
