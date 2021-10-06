require 'rails_helper'

RSpec.describe "video_feedback_reviews/index", type: :view do
  before(:each) do
    assign(:video_feedback_reviews, [
      VideoFeedbackReview.create!(),
      VideoFeedbackReview.create!()
    ])
  end

  it "renders a list of video_feedback_reviews" do
    render
  end
end
