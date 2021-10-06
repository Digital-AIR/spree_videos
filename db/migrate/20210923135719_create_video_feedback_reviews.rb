class CreateVideoFeedbackReviews < ActiveRecord::Migration[6.1]
   def self.up
    create_table :spree_video_feedback_reviews do |t|
      t.integer :user_id
      t.integer :video_review_id, null: false
      t.integer :rating,    default: 0
      t.text    :comment
      t.string  :locale, default: 'en'
      t.timestamps null: false
    end
    add_index :spree_video_feedback_reviews, :video_review_id
    add_index :spree_video_feedback_reviews, :user_id
  end

  def self.down
    drop_table :spree_video_feedback_reviews
  end
end
