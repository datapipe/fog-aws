module Fog
  module Parsers
    module CloudTrail
      module AWS
        class UpdateTrail < Fog::Parsers::Base

          # {
          #     "CloudWatchLogsLogGroupArn"  => "string",
          #     "CloudWatchLogsRoleArn"      => "string",
          #     "IncludeGlobalServiceEvents" => "boolean",
          #     "IsMultiRegionTrail"         => "boolean",
          #     "KmsKeyId"                   => "string",
          #     "LogFileValidationEnabled"   => "boolean",
          #     "Name"                       => "string",
          #     "S3BucketName"               => "string",
          #     "S3KeyPrefix"                => "string",
          #     "SnsTopicName"               => "string",
          #     "TrailARN"                   => "string"
          # }

          def reset
            @response = { 'Trail' => {} }
          end

          def end_element(name)
            case name
              when 'CloudWatchLogsLogGroupArn',
                   'CloudWatchLogsRoleArn',
                   'IncludeGlobalServiceEvents',
                   'IsMultiRegionTrail',
                   'KmsKeyId',
                   'LogFileValidationEnabled',
                   'Name',
                   'S3BucketName',
                   'S3KeyPrefix',
                   'SnsTopicName',
                   'TrailARN'
                  @response['Trail'][name] = value
              when 'RequestId'
                @response[name] = value
            end
          end

        end
      end
    end
  end
end