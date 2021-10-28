module Spree
  module Api
    module V2
      module Storefront
        class VideosController < ::Spree::Api::V2::BaseController
          include Spree::Api::V2::CollectionOptionsHelpers

          def index
            videos = collection.all.page(params[:page]).per(params[:per_page])
            render_serialized_payload { serialize_collection(videos) }
          end

          def show
            render_serialized_payload { serialize_resource(resource) }
          end
          
          
          
          private

          def model_class
            ::Spree::Video
          end

          def scope
            ::Spree::Video
          end

          def resource
            scope.find_by(slug: params[:id]) || scope.find(params[:id])
          end

          def collection
            @collection ||= collection_finder.new(scope: scope, params: params).execute
          end

          def collection_finder
            Spree::Videos::Find
          end

          def resource_serializer
            Spree::V2::Storefront::VideoSerializer
          end

          def collection_serializer
            Spree::V2::Storefront::VideoSerializer
          end

    		end
      end
    end
  end
end