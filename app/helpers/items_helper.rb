module ItemsHelper
include ActionView::Helpers::DateHelper

  def time_left(item)
    if item.expired?
      "Item Expired!"
    else
      "#{distance_of_time_in_words(7.days.ago, item.created_at)} remaining!"
    end
  end
end
