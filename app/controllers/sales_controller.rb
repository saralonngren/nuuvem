require 'csv'

class SalesController < ApplicationController

  def index
    @sales = Sale.all
    @total_price = params[:total_price]
  end

  def import_file
    raise 'Arquivo não encontrado' unless params[:file].present?

    total_price = create_sale_and_count_prince(params[:file])
    redirect_to sales_path(total_price: total_price), notice: 'Sales uploaded successfully'
  
  rescue StandardError => e
    redirect_to sales_path, notice: "#{e.message} Please verify the file and try again."
  end

  private

  def create_sale_and_count_prince(file)
    total_price = 0

    CSV.foreach(file, headers: true, col_sep: "\t") do |row|
      sale = row.to_h
      total_price += (sale['item price'].to_f * sale['purchase count'].to_i ) 

      Sale.create(
        purchaser_name: sale['purchaser name'],
        item_description: sale['item description'],
        item_price: sale['item price'].to_f,
        purchase_count: sale['purchase count'].to_i,
        merchant_address: sale['merchant address'],
        merchant_name: sale['merchant name']
      )
    end

    total_price
  end
end