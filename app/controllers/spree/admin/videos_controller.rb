module Spree
  module Admin
    class VideosController < ResourceController
      before_action :set_video, only: [:show, :edit, :update, :destroy]
      before_action :load_data
      # GET /videos
      def index
        @videos = Video.all
      end

      # GET /videos/1
      def show
      end

      # GET /videos/new
      def new
        @video = Video.new
      end

      # GET /videos/1/edit
      def edit
      end

      # POST /videos
      def create
        @video = Video.new(video_params)

        if @video.save
          redirect_to spree.admin_videos_url, notice: 'Video was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /videos/1
      def update
        if @video.update(video_params)
          redirect_to @video, notice: 'Video was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /videos/1
      def destroy
        @video.destroy
        redirect_to videos_url, notice: 'Video was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_video
          @video = Video.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def video_params
          params.fetch(:video, {}).permit(:name,:slug,:description,:seo_title,:seo_description, :primary_product, product_ids: [])
        end

        def load_data
          @available_products = Product.order(:name)
        end


    end
  end
end