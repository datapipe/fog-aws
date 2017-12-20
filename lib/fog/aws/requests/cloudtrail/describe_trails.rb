module Fog
  module AWS
    class CloudTrail

      class Real
        require 'fog/aws/parsers/cloudtrail/describe_trails'

        def describe_trails(options = nil)
          params = (options || {}).merge({
                                             'Action' => 'DescribeTrails',
                                             :parser  => Fog::Parsers::CloudTrail::AWS::DescribeTrails.new
                                         })
          request(params)
        end

      end

      class Mock
        def describe_trails(options = nil)
          Fog::Mock.not_implemented
        end
      end

    end
  end
end
