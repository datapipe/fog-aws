module Fog
  module AWS
    class CloudTrail


      class Real
        require 'fog/aws/parsers/cloudtrail/remove_tags'

        def remove_tags(resource_id, tags)
          request({
              'Action' => 'RemoveTags',
              'ResourceId' => resource_id,
              'TagsList' => tags,
              :parser => Fog::Parsers::CloudTrail::AWS::RemoveTags.new
            })
        end
      end


      class Mock
        def remove_tags(resource_id, tags)
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
