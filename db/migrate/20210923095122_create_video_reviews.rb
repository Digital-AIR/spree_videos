class CreateVideoReviews < ActiveRecord::Migration[6.1]
  def self.up
    create_table :spree_video_reviews do |t|
      t.integer :video_id
      t.string  :name
      t.string  :location
      t.integer :rating
      t.text    :title
      t.text    :review
      t.boolean :approved, default: false	
      t.integer :user_id, null: true
      t.string  :ip_address
      t.string  :locale, default: 'en'
      t.boolean :show_identifier, default: true, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_video_reviews
  end
end