module Fog
  module AWS
    class CloudTrail

      class Real
        require 'fog/aws/parsers/cloudtrail/add_tags'

        def add_tags(resource_id, tags)
          serialized_keys = Fog::AWS.serialize_keys('TagsList', [*tags])
          request(serialized_keys.merge({
              'Action' => 'AddTags',
              'ResourceId' => resource_id,
              :parser => Fog::Parsers::CloudTrail::AWS::AddTags.new
            }))
        end
      end


      class Mock
        def add_tags(resource_id, tags)
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
