class Delivery < ApplicationRecord
    scope :gross_income_by_sales_data , -> { group('date(created_at)').sum('item_price * purchase_count') }
    scope :total_all_time_gross_income , -> { sum('item_price * purchase_count') }
end
