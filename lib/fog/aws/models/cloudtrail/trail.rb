require 'fog/core/model'

module Fog
  module AWS
    class CloudTrail
      class Trail < Fog::Model
        identity  :trail_arn, :aliases => 'TrailARN'
        attribute :name, :aliases => 'Name'
        attribute :include_global_service_events, :aliases => 'IncludeGlobalServiceEvents', :type => :boolean
        attribute :s3_bucket_name, :aliases => 'S3BucketName'
        attribute :s3_key_prefix, :aliases => 'S3KeyPrefix'
        attribute :sns_topic_name, :aliases => 'SnsTopicName'
        attribute :cloud_watch_logs_log_group_arn, :aliases => 'CloudWatchLogsLogGroupArn'
        attribute :cloud_watch_logs_role_arn, :aliases => 'CloudWatchLogsRoleArn'
        attribute :home_region, :aliases => 'HomeRegion'
        attribute :is_multi_region_trail, :aliases => 'IsMultiRegionTrail', :type => :boolean
        attribute :kms_key_id, :aliases => 'KmsKeyId'
        attribute :log_file_validation_enabled, :aliases => 'LogFileValidationEnabled', :type => :boolean


        def initialize(attributes={})
          super
        end

        def destroy
          requires :name
          service.delete_trail(name)
          true
        end

        def status
          requires :name
          service.get_trail_status(name)
        end

        def start_logging
          requires :name
          service.start_logging(name)
          true
        end

        def stop_logging
          requires :name
          service.stop_logging(name)
          true
        end

        def save
          requires :name
          requires :s3_bucket_name
          requires :s3_key_prefix
          requires :include_global

          data           =
              if persisted?
                service.update_trail(name, s3_bucket_name, s3_key_prefix, sns_topic_name, include_global).body
              else
                service.create_trail(name, s3_bucket_name, s3_key_prefix, sns_topic_name, include_global).body
              end
          new_attributes = data.reject { |key, value| key == 'requestId' }
          merge_attributes(new_attributes)
        end

        def persisted?
          attributes[:is_persisted]
        end

      end
    end
  end
end