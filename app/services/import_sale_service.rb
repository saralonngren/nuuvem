class ImportSaleService

  def initialize(file)
    @file = file
    @content_type = file.content_type
    @total_price = 0
  end 

  def run
    content_type_valid?
    create_sale_and_count_prince
    total_price
  end

  def create_sale_and_count_prince
    CSV.foreach(@file, headers: true, col_sep: "\t") do |row|
      sale = row.to_h
      @total_price += (sale['item price'].to_f * sale['purchase count'].to_i ) 

      Sale.create(
        purchaser_name: sale['purchaser name'],
        item_description: sale['item description'],
        item_price: sale['item price'].to_f,
        purchase_count: sale['purchase count'].to_i,
        merchant_address: sale['merchant address'],
        merchant_name: sale['merchant name']
      )
    end
  end

  def total_price
    @total_price
  end 

  private

  def content_type_valid?
    %w(text/csv application/octet-stream application/vnd.ms-excel).include?(@content_type)
  end
end 