require 'pry'

RSpec.describe SniperLinks do
  it "has a version number" do
    expect(SniperLinks::VERSION).not_to be nil
  end

  context "when working with GMail" do
    context "when supplied an email ending in @gmail.com" do
      subject { SniperLinks.new(email) }

      let(:email) { "plop@gmail.com" }

      it "is expected to use the GMail sniper link strategy automatically" do
        expect(subject.sniper_link_strategy).to be_a(SniperLinks::Strategies::GMail)
      end

      context "when generating a sniper link" do
        let(:from) { "howdy@zero-one.io" }

        it "is expected to generate a sniper link" do
          expect(subject.sniper_link(from)).to be_a(URI)
        end
      end
    end
  end
end
