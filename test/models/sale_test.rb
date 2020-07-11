# == Schema Information
#
# Table name: sales
#
#  id               :bigint           not null, primary key
#  purchaser_name   :string
#  item_description :string
#  item_price       :float
#  purchase_count   :integer
#  merchant_name    :string
#  merchant_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
