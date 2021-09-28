require 'rails_helper'

RSpec.describe "video_feedback_reviews/show", type: :view do
  before(:each) do
    @video_feedback_review = assign(:video_feedback_review, VideoFeedbackReview.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
