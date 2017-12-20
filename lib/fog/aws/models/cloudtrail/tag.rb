module Fog
  module AWS
    class CloudTrail

      class Tag < Fog::Model

        identity  :key,         :aliases => 'Key'
        attribute :value,       :aliases => 'Value'
        attribute :resource_id, :aliases => 'ResourceId'

        def initialize(attributes = {})
          super
        end

        def destroy
          requires :key, :resource_id
          service.remove_tags(resource_id, key => value)
          true
        end

        def save
          requires :key, :resource_id
          service.add_tags(resource_id, key => value)
          true
        end
      end

    end
  end
end
