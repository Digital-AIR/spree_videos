class AddRatingToVideos < SpreeExtension::Migration[4.2]
  def self.up
      add_column :spree_videos, :avg_rating, :decimal, default: 0.0, null: false, precision: 7, scale: 5
      add_column :spree_videos, :reviews_count, :integer, default: 0, null: false
  end

  def self.down
      remove_column :spree_videos, :reviews_count
      remove_column :spree_videos, :avg_rating
  end
end