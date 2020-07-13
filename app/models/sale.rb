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
class Sale < ApplicationRecord

  validates :item_price, numericality: true
  validates :purchase_count, numericality: { only_integer: true }
  validates :purchaser_name, :item_description, :merchant_name,
            :merchant_address, presence: true
end
