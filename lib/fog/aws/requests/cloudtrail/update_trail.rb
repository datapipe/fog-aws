module Fog
  module AWS
    class CloudTrail

      # {
      #     "CloudWatchLogsLogGroupArn"  => "string",
      #     "CloudWatchLogsRoleArn"      => "string",
      #     "EnableLogFileValidation"    => "boolean",
      #     "IncludeGlobalServiceEvents" => "boolean",
      #     "IsMultiRegionTrail"         => "boolean",
      #     "KmsKeyId"                   => "string",
      #     "Name"                       => "string" ! required,
      #     "S3BucketName"               => "string",
      #     "S3KeyPrefix"                => "string",
      #     "SnsTopicName"               => "string"
      # }

      class Real
        require 'fog/aws/parsers/cloudtrail/update_trail'

        def update_trail(name, options = nil)
          request({
              'Action' => 'UpdateTrail',
              'Name' => name,
              :parser => Fog::Parsers::CloudTrail::AWS::UpdateTrail.new
            }.merge(options || {}))
        end
      end

      class Mock
        def start_logging(name, options = nil)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
