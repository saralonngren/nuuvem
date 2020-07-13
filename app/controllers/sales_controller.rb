require 'csv'

class SalesController < ApplicationController
  def index
    @sales = Sale.all
    @total_price = params[:total_price]
  end

  def import_file
    raise 'No file found.' unless params[:file].present?

    import = ImportSaleService.new(params[:file]).run
    redirect_to sales_path(total_price: import), notice: 'Sales uploaded successfully'
  end
end