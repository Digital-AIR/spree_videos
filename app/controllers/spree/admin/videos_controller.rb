module Spree
  module Admin
    class VideosController < ResourceController
      before_action :set_video, only: [:show, :edit, :update, :destroy]
      before_action :load_data
<<<<<<< HEAD

      before_action only: [:create, :update] do
        set_vendor_id()
      end

      # GET /videos
      def index
        @videos = if params[:ids].present?
                       scope.where(id: params[:ids].split(','))
                     else
                       scope.load.ransack(
                         params[:q]
                       ).result
                     end
        # @videos = Video.all
=======
      # GET /videos
      def index
        @videos = Video.all
>>>>>>> 5ebaaa3 (Video Extension)
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
<<<<<<< HEAD
        @video = Video.new(video_params.except(:upload_video))
        if @video.save
          if permitted_resource_params[:upload_video]
            @video.create_upload_video(attachment: permitted_resource_params.delete(:upload_video))
          end
=======
        @video = Video.new(video_params)

        if @video.save
>>>>>>> 5ebaaa3 (Video Extension)
          redirect_to spree.admin_videos_url, notice: 'Video was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /videos/1
      def update
<<<<<<< HEAD
        if permitted_resource_params[:upload_video]
          @video.create_upload_video(attachment: permitted_resource_params.delete(:upload_video))
        end

        if @video.update(video_params)
          redirect_to spree.admin_videos_url, notice: 'Video was successfully updated.'
=======
        if @video.update(video_params)
<<<<<<< HEAD
          redirect_to @video, notice: 'Video was successfully updated.'
>>>>>>> 5ebaaa3 (Video Extension)
=======
          redirect_to spree.admin_videos_url, notice: 'Video was successfully updated.'
>>>>>>> 1a8a85c (Video Extension.)
        else
          render :edit
        end
      end

      # DELETE /videos/1
      def destroy
        @video.destroy
<<<<<<< HEAD
<<<<<<< HEAD
        if @video.destroy
          flash[:success] = 'Video was successfully destroyed.'
        else
          flash[:error] = 'Video was not successfully destroyed.'
        end
        respond_with(@video) do |format|
          format.html { redirect_to collection_url }
          format.js { render_js_for_destroy }
        end
=======
        redirect_to videos_url, notice: 'Video was successfully destroyed.'
>>>>>>> 5ebaaa3 (Video Extension)
=======
        redirect_to spree.admin_videos_url, notice: 'Video was successfully destroyed.'
>>>>>>> 1a8a85c (Video Extension.)
      end

      private
        # Use callbacks to share common setup or constraints between actions.
<<<<<<< HEAD
        def collection
          params[:q] = {} if params[:q].blank?
          videos = super.order(priority: :asc)
          @search = videos.ransack(params[:q])

          @collection = @search.result.
              page(params[:page]).
              per(params[:per_page])
        end

=======
>>>>>>> 5ebaaa3 (Video Extension)
        def set_video
          @video = Video.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def video_params
<<<<<<< HEAD
<<<<<<< HEAD
          params.require(:video).permit(:vendor_id, :name,:slug,:description,:seo_title,:seo_description,:available_on,:discontinue_on,:primary_product_id,:upload_video, product_ids: [], taxon_ids:[] )
        end

        def scope
          Spree::Video.accessible_by(current_ability)
        end

        def load_data
          if current_spree_user.has_spree_role?("admin")
            @products = Product.order(:name)          
          else
            @products = Product.order(:name).where(vendor_id: current_spree_user.vendors.active.ids) 
          end

          @taxons = Taxon.order(:name)
          @vendors = Vendor.order(Arel.sql('LOWER(name)'))
=======
          params.fetch(:video, {}).permit(:name,:slug,:description,:seo_title,:seo_description, :primary_product, product_ids: [])
=======
          params.fetch(:video, {}).permit(:name,:slug,:description,:seo_title,:seo_description, :primary_product_id, product_ids: [])
>>>>>>> 1a8a85c (Video Extension.)
        end

        def load_data
          @available_products = Product.order(:name)
>>>>>>> 5ebaaa3 (Video Extension)
        end


    end
  end
end