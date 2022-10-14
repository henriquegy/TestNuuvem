# frozen_string_literal: true
require_relative '../domain/deliveries/manager_deliveries'

class DashboardsController < ApplicationController
  def show
    manager_deliveries = Deliveries::ManagerDeliveries.new
    @gross_income_by_sales_data = manager_deliveries.gross_income_by_sales_data
    @total_all_time_gross_income = manager_deliveries.total_all_time_gross_income
  end

  def new
  end

  def create
    begin
      ProcessingDeliveriesByFile.call(parser_params["file_data"])
      render :show
    rescue StandardError => e
      Rails.logger.info("Delivery create request error: #{e.message}")
      raise e
    end
  end

  private

  def parser_params
    params.require(:parser).permit(:file_data)
  end
end
