module Fog
  module Parsers
    module CloudTrail
      module AWS
        class ListTags < Fog::Parsers::Base

          def reset
            @tag      = {}
            @resource_tag_list = { 'tagsList' => [] }
            @response = { 'resourceTagList' => [] }
            @in_tag_list = false
          end

          def start_element(name, attrs = [])
            super
            case name
              when 'TagsList'
                @in_tag_list = true
            end
          end

          def end_element(name)
            case name
              when 'Key','Value'
                @tag[name] = value
              when 'member'
                if @in_tag_list
                  @resource_tag_list['tagsList'] << @tag
                else
                  @response['resourceTagList'] << @resource_tag_list
                  @resource_tag_list = { 'tagsList' => [] }
                end
                @tag = {}
              when 'ResourceId'
                @resource_tag_list[name] = value
              when 'TagsList'
                @in_tag_list = false
              when 'NextToken'
                @response['nextToken'] = value
              when 'RequestId'
                @response[name] = value
            end
          end

        end
      end
    end
  end
end