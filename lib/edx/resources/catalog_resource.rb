module Edx
  module Resources
    class CatalogResource < ResourceKit::Resource
      API_ENDPOINT = 'https://api.edx.org'.freeze
      CATALOG_RESOURCE = '/catalog/v1/catalogs/'.freeze

      resources do
        action :all do
          path File.join(API_ENDPOINT, CATALOG_RESOURCE).freeze
          query_keys :limit, :offset
          handler(200) { |resp| resp.body['results'].map { |r| hydrate_result(r) } }
        end

        action :find do
          path File.join(API_ENDPOINT, CATALOG_RESOURCE, ':id').freeze
          handler(200) { |resp| Models::Catalog.new(resp.body) }
        end
      end

      private

      def hydrate_result(result)
        Models::Catalog.new(result)
      end
    end
  end
end
