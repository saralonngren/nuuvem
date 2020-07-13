require 'csv'

class ImportSaleService
  attr_reader :total_price
  
  def initialize(file)
    @file = file
    @content_type = file.content_type
    @total_price = 0
  end 

  def run
    content_type_valid?
    create_sale_and_count_prince
  end

  def create_sale_and_count_prince
    CSV.foreach(@file, headers: true, col_sep: "\t") do |row|
      sale = row.to_h 
      @total_price += (sale['item price'].to_f * sale['purchase count'].to_i )

      Sale.create(
        purchaser_name: sale['purchaser name'],
        item_description: sale['item description'],
        item_price: sale['item price'],
        purchase_count: sale['purchase count'],
        merchant_address: sale['merchant address'],
        merchant_name: sale['merchant name']
      )
    end
  end

  private

  def content_type_valid?
    %w(text/csv application/octet-stream application/vnd.ms-excel text/tab-separated-values).include?(@content_type)
  end
end 