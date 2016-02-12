module Fog
  module Parsers
    module CloudTrail
      module AWS
        class GetTrailStatus < Fog::Parsers::Base

          # {
          #     "IsLogging"                          => "boolean",
          #     "LatestCloudWatchLogsDeliveryError"  => "string",
          #     "LatestCloudWatchLogsDeliveryTime"   => "number",
          #     "LatestDeliveryAttemptSucceeded"     => "string",
          #     "LatestDeliveryAttemptTime"          => "string",
          #     "LatestDeliveryError"                => "string",
          #     "LatestDeliveryTime"                 => "number",
          #     "LatestDigestDeliveryError"          => "string",
          #     "LatestDigestDeliveryTime"           => "number",
          #     "LatestNotificationAttemptSucceeded" => "string",
          #     "LatestNotificationAttemptTime"      => "string",
          #     "LatestNotificationError"            => "string",
          #     "LatestNotificationTime"             => "number",
          #     "StartLoggingTime"                   => "number",
          #     "StopLoggingTime"                    => "number",
          #     "TimeLoggingStarted"                 => "string",
          #     "TimeLoggingStopped"                 => "string"
          # }

          def reset
            @response = {
              'TrailStatus' => {
                  'IsLogging'                          => nil,
                  'LatestCloudWatchLogsDeliveryError'  => nil,
                  'LatestCloudWatchLogsDeliveryTime'   => nil,
                  'LatestDeliveryAttemptSucceeded'     => nil,
                  'LatestDeliveryAttemptTime'          => nil,
                  'LatestDeliveryError'                => nil,
                  'LatestDeliveryTime'                 => nil,
                  'LatestDigestDeliveryError'          => nil,
                  'LatestDigestDeliveryTime'           => nil,
                  'LatestNotificationAttemptSucceeded' => nil,
                  'LatestNotificationAttemptTime'      => nil,
                  'LatestNotificationError'            => nil,
                  'LatestNotificationTime'             => nil,
                  'StartLoggingTime'                   => nil,
                  'StopLoggingTime'                    => nil,
                  'TimeLoggingStarted'                 => nil,
                  'TimeLoggingStopped'                 => nil
              }
            }
          end

          def end_element(name)
            case name
              when 'IsLogging',
                  'LatestCloudWatchLogsDeliveryError',
                  'LatestCloudWatchLogsDeliveryTime',
                  'LatestDeliveryAttemptSucceeded',
                  'LatestDeliveryAttemptTime',
                  'LatestDeliveryError',
                  'LatestDeliveryTime',
                  'LatestDigestDeliveryError',
                  'LatestDigestDeliveryTime',
                  'LatestNotificationAttemptSucceeded',
                  'LatestNotificationAttemptTime',
                  'LatestNotificationError',
                  'LatestNotificationTime',
                  'StartLoggingTime',
                  'StopLoggingTime',
                  'TimeLoggingStarted',
                  'TimeLoggingStopped'
                  @response['TrailStatus'][name] = value
              when 'RequestId'
                @response[name] = value
            end
          end

        end
      end
    end
  end
end