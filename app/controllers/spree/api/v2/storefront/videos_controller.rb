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

          def collection_meta(collection)
            super(collection).merge(filters: filters_meta)
          end

          def resource_meta(resource)
            {
            product_filters: resource_filters_meta
            }
          end

          def resource_options(resource)
            {
              meta: resource_meta(resource),
              include: resource_includes,
              fields: sparse_fields
            }
          end

          def filters_meta
            Spree::Api::Videos::FiltersPresenter.new().to_h
          end

          def resource_filters_meta
            Spree::Api::Products::FiltersPresenter.new(current_store, current_currency, params).to_h
          end

          def serialize_resource(resource)
            resource_serializer.new(
              resource,
              resource_options(resource).merge(params: serializer_params)
              # params: serializer_params,
              # include: resource_includes,
              # fields: sparse_fields
            ).serializable_hash
          end

    		end
      end
    end
  end
end