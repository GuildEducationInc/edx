module Edx
  module Resources
    class CourseResource < ResourceKit::Resource
      API_ENDPOINT = 'https://prod-edx-discovery.edx.org'.freeze
      COURSE_RESOURCE = '/api/v1/catalogs/:id/courses/'.freeze

      resources do
        action :all do
          path File.join(API_ENDPOINT, COURSE_RESOURCE).freeze
          query_keys :limit, :offset
          handler(200) { |resp| resp.body['results'].map { |r| hydrate_result(r) } }
        end
      end

      private

      def hydrate_result(result)
        Models::Course.new(result)
      end
    end
  end
end
