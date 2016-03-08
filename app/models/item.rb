class Item < ActiveRecord::Base
  belongs_to :user

  def self.update_items(item_string)
    return Item.none if item_string.blank?
  end

  default_scope { order('created_at DESC') }

  def expired?
    remaining = (created_at - 7.days.ago)

    if remaining < 0
      true
    else
      false
    end
  end
end
