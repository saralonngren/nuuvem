class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    # binding.pry
    # @file = params[:file].path

    # csv = CSV.new(@file, headers: true, col_sep: '\t')
  end

  private

  # def content_type_valid?
  #   %w(text/csv application/octet-stream application/vnd.ms-excel).include?(@content_type)
  # end
end