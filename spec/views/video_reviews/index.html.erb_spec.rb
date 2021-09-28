require 'rails_helper'

RSpec.describe "video_reviews/index", type: :view do
  before(:each) do
    assign(:video_reviews, [
      VideoReview.create!(),
      VideoReview.create!()
    ])
  end

  it "renders a list of video_reviews" do
    render
  end
end
