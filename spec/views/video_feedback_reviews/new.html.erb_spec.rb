require 'rails_helper'

RSpec.describe "video_feedback_reviews/new", type: :view do
  before(:each) do
    assign(:video_feedback_review, VideoFeedbackReview.new())
  end

  it "renders new video_feedback_review form" do
    render

    assert_select "form[action=?][method=?]", video_feedback_reviews_path, "post" do
    end
  end
end
