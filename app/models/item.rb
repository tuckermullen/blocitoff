class Item < ActiveRecord::Base
  belongs_to :user

  def self.update_items(item_string)
    return Item.none if item_string.blank?
  end

  default_scope { order('created_at DESC') }
end
