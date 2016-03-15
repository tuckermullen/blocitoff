namespace :todo do
  desc "Automatically deletes items that are older than 7 days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
