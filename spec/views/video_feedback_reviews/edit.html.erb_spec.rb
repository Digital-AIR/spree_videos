require 'rails_helper'

RSpec.describe "video_feedback_reviews/edit", type: :view do
  before(:each) do
    @video_feedback_review = assign(:video_feedback_review, VideoFeedbackReview.create!())
  end

  it "renders the edit video_feedback_review form" do
    render

    assert_select "form[action=?][method=?]", video_feedback_review_path(@video_feedback_review), "post" do
    end
  end
end
