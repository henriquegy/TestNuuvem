module Deliveries
    class ManagerDeliveries    
        def create_deliveries_by_file(data = [])
            begin
                raise "Delivery can't be empty!" unless data.present?
                
                Delivery.create!(
                    purchaser_name: data[0],
                    item_description: data[1],
                    item_price: data[2],
                    purchase_count: data[3],
                    merchant_address: data[4],
                    merchant_name: data[5]
                )
            rescue StandardError => e
                raise "Deliveries::ManagerDeliveries error: #{e.message}"
            end
        end

        def gross_income_by_sales_data
            Delivery.gross_income_by_sales_data
        end

        def total_all_time_gross_income
            Delivery.total_all_time_gross_income
        end
    end    
end
