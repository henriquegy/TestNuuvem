require "rails_helper"

RSpec.describe Deliveries::ManagerDeliveries do
    subject(:manager) { described_class.new }

    context "when data exists" do
        let(:data) { 
            ["João Silva",
            "Pepperoni Pizza Slice",
            "10.0",
            "2",
            "987 Fake St",
            "Bob's Pizza"]
        }

        it "uploads data as expected" do
            manager.create_deliveries_by_file(data)
            expect(Delivery.all.count).to be > 0
        end
    end

    context "when data not exists" do
        let(:data) {[]}

        it "uploads data empty" do
            expect{manager.create_deliveries_by_file(data)}.to raise_error("Deliveries::ManagerDeliveries error: Delivery can't be empty!")
        end
    end

    context "when look gross income" do
        subject(:deliveries) { create_list(:delivery, 10) }
        let(:before_gross_income) { Delivery.gross_income_by_sales_data }
        let(:before_total_gross_income) { Delivery.total_all_time_gross_income }      
        
        before do
            deliveries
            Delivery.all.limit(2).update_all(created_at: DateTime.now - 2)
            before_gross_income
        end

        it "totalize correcly by sales data" do
            expect(manager.gross_income_by_sales_data.to_s).to eq(before_gross_income.to_s)
        end

        it "total all-time gross income" do
            expect(manager.total_all_time_gross_income).to eq(before_total_gross_income)
        end
    end
end