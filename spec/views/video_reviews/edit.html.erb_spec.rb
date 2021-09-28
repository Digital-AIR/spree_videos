require 'rails_helper'

RSpec.describe "video_reviews/edit", type: :view do
  before(:each) do
    @video_review = assign(:video_review, VideoReview.create!())
  end

  it "renders the edit video_review form" do
    render

    assert_select "form[action=?][method=?]", video_review_path(@video_review), "post" do
    end
  end
end
