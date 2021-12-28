module Spree::Api::V2::BaseControllerDecorator
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

Spree::Api::V2::BaseController.prepend Spree::Api::V2::BaseControllerDecorator