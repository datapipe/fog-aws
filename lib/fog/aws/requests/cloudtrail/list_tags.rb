module Fog
  module AWS
    class CloudTrail


      class Real
        require 'fog/aws/parsers/cloudtrail/list_tags'

        def list_tags(resource_ids, options = nil)
          request({
              'Action' => 'ListTags',
              'ResourceIdList' => [*resource_ids],
              :parser => Fog::Parsers::CloudTrail::AWS::ListTags.new
            }.merge(options || {}) )
        end
      end


      class Mock
        def list_tags(resource_ids, options = nil)
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
