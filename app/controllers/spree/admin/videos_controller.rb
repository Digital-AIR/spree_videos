module Spree
  module Admin
    class VideosController < ResourceController
      before_action :set_video, only: [:edit, :update, :destroy]
      before_action :load_data

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
        @video = Video.new(video_params.except(:upload_video))
        if @video.save
          if permitted_resource_params[:upload_video]
            @video.create_upload_video(attachment: permitted_resource_params.delete(:upload_video))
          end
          redirect_to spree.admin_videos_url, notice: 'Video was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /videos/1
      def update
        if permitted_resource_params[:upload_video]
          @video.create_upload_video(attachment: permitted_resource_params.delete(:upload_video))
        end

        if @video.update(video_params)
          redirect_to spree.admin_videos_url, notice: 'Video was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /videos/1
      def destroy
        @video.destroy
        if @video.destroy
          flash[:success] = 'Video was successfully destroyed.'
        else
          flash[:error] = 'Video was not successfully destroyed.'
        end
        respond_with(@video) do |format|
          format.html { redirect_to collection_url }
          format.js { render_js_for_destroy }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def collection
          params[:q] = {} if params[:q].blank?
          videos = super.order(priority: :asc)
          @search = videos.ransack(params[:q])

          @collection = @search.result.
              includes(video_includes).
              page(params[:page]).
              per(params[:per_page])
        end


        def video_includes
        {
          products: [],
          taxons: [],
          upload_video: [],
          vendor: [],
          primary_product: []
        }

      end

        def set_video
          @video = Video.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def video_params
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
        end

    end
  end
end