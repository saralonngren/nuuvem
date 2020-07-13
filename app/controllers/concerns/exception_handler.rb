require 'csv'

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      redirect_to sales_path, notice: "#{e.message} Please verify the file and try again."
    end

    rescue_from CSV::MalformedCSVError do 
      redirect_to sales_path, notice: "There are some error in your file. Please verify the file and try again."
    end 
  end
end