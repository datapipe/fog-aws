require 'fog/aws/models/cloudtrail/trail'

module Fog
  module AWS
    class CloudTrail
      class Trails < Fog::Collection

        model Fog::AWS::CloudTrail::Trail

        def all(options = nil)
          data = service.describe_trails(options).body['trailList']
          pdata = data.map{|d| d.merge(:is_persisted => true)} if data
          load(pdata)
        end

        def get(identity, options = nil)
          data = service.describe_trails({'TrailNameList' => identity}.merge(options || {})).body['trailList'].first
          new(data.merge(:is_persisted => true)) unless data.nil?
        end
      end
    end
  end
end