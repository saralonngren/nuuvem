class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import_file
    raise 'File not found.' unless params[:file].present?

    import = ImportSaleService.new(params[:file])
    import.run

    if import.total_price == 0
      redirect_to sales_path, 
                  notice: 'Your total gross income is 0. You may have added some wrong value to your columns or the calculation its really 0. 🤔'
    else
      redirect_to sales_path, 
                  notice: "Sales uploaded successfully 🥳 Your total gross income is #{import.total_price}"
    end
  end
end