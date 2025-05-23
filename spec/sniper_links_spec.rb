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

      its(:sniper_link_strategy) { is_expected.to be_a(SniperLinks::Strategies::GMail) }

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it { is_expected.to be_a(URI) }

        its(:host)     { is_expected.to eq "mail.google.com" }
        its(:fragment) { is_expected.to start_with("search/") }
      end
    end
  end

  context "when working with Outlook" do
    context "when supplied an email ending in @outlook.com" do
      let(:email) { "plop@outlook.com" }

      its(:sniper_link_strategy) { is_expected.to be_a(SniperLinks::Strategies::Outlook) }

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it { is_expected.to be_a(URI) }

        its(:host)  { is_expected.to eq "outlook.live.com" }
        its(:query) { is_expected.to start_with("login_hint=") }
      end
    end
  end

  context "when working with Yahoo" do
    context "when supplied an email ending in @yahoo.com" do
      let(:email) { "plop@yahoo.com" }

      its(:sniper_link_strategy) { is_expected.to be_a(SniperLinks::Strategies::Yahoo) }

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it { is_expected.to be_a(URI) }

        its(:host) { is_expected.to eq "mail.yahoo.com" }
        its(:path) { is_expected.to start_with("/d/search/keyword=") }
      end
    end
  end

  context "when working with Proton" do
    context "when supplied an email ending in @yahoo.com" do
      let(:email) { "plop@proton.me" }

      its(:sniper_link_strategy) { is_expected.to be_a(SniperLinks::Strategies::Proton) }

      context "when generating a sniper link" do
        subject(:strategy_obj) { sniper_link_obj.sniper_link(from) }

        it { is_expected.to be_a(URI) }

        its(:host)     { is_expected.to eq "mail.proton.me" }
        its(:path)     { is_expected.to start_with("/u/0/all-mail") }
        its(:fragment) { is_expected.to start_with("from=") }
      end
    end
  end
end
