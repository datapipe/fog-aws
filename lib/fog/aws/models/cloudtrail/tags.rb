require 'fog/aws/models/compute/tag'

module Fog
  module AWS
    class CloudTrail
      class Tags < Fog::Collection
        attribute :resource_id

        model Fog::AWS::CloudTrail::Tag

        def initialize(attributes)
          super
        end

        def all(resource_ids)
          data = service.list_tags(resource_ids).body
          data['resourceTagList'].each do |rtl|
            rtl['tagsList'].each do |tl|
              tl['ResourceId'] = rtl['ResourceId']
            end
          end
          load(data['resourceTagList'].collect { |rtl| rtl['tagsList'] }.flatten)
        end

        # def get(resource_id, key)
        #   if key
        #     self.class.new(:service => service).all('key' => key)
        #   end
        # end
      end
    end
  end
end
