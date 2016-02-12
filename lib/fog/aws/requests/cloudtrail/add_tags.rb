module Fog
  module AWS
    class CloudTrail

      class Real
        require 'fog/aws/parsers/cloudtrail/add_tags'

        def add_tags(resource_id, tags)
          request({
              'Action' => 'AddTags',
              'ResourceId' => resource_id,
              'TagsList' => tags,
              :parser => Fog::Parsers::CloudTrail::AWS::AddTags.new
            })
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
