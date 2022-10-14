require "rails_helper"

RSpec.describe ProcessingDeliveriesByFile do
    context "when file exists" do
        subject(:delivery) { described_class.call(file) }
        let(:file) { fixture_file_upload('example_input.tab') }

        it "uploads file expected" do
            delivery
            expect(Delivery.all.count).to be > 0
        end
    end

    context "when file not exists" do
        subject(:delivery) { described_class.call(file) }
        let(:file) { nil }

        it "raise erros" do
            expect { delivery }.to raise_error(an_instance_of(RuntimeError))
        end
    end
end