module Fog
  module AWS
    class CloudTrail

      # {
      #     "CloudWatchLogsLogGroupArn": "string", optional
      #     "CloudWatchLogsRoleArn": "string",     optional
      #     "EnableLogFileValidation": boolean,    optional
      #     "IncludeGlobalServiceEvents": boolean, optional
      #     "IsMultiRegionTrail": boolean,         optional
      #     "KmsKeyId": "string",                  optional
      #     "Name": "string",                      ! required
      #     "S3BucketName": "string",              ! required
      #     "S3KeyPrefix": "string",               optional
      #     "SnsTopicName": "string"               optional
      # }

      class Real
        require 'fog/aws/parsers/cloudtrail/create_trail'

        def create_trail(name, s3_bucket_name, options = nil)
          request({
              'Action'       => 'CreateTrail',
              'Name'         => name,
              'S3BucketName' => s3_bucket_name,
              :parser        => Fog::Parsers::CloudTrail::AWS::CreateTrail.new
            }.merge(options || {}))
        end
      end

      class Mock
        def create_trail(name, s3_bucket_name, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
