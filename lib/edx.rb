require 'virtus'
require 'resource_kit'
require 'edx/version'
require 'edx/http_client'
require 'edx/client'
require 'edx/authenticator'
require 'edx/response'

# Models
require 'edx/models/image'
require 'edx/models/video'
require 'edx/models/organization'
require 'edx/models/person'
require 'edx/models/seat'
require 'edx/models/course_run'
require 'edx/models/course'
require 'edx/models/catalog'

# Resources
require 'edx/resources/catalog_resource'
require 'edx/resources/course_resource'

module Edx
  def self.config
    @config ||= Struct.new(:client_id, :client_secret).new
  end

  def self.configure
    yield config
  end

  def self.client
    @client ||= begin
      http = Edx::HttpClient.new
      authenticator = Edx::Authenticator.new(connection: http,
                                             client_id: config.client_id,
                                             client_secret: config.client_secret)
      Edx::Client.new(client: http, authenticator: authenticator)
    end
  end

  def self.catalog
    Resources::CatalogResource.new(connection: client)
  end

  def self.course
    Resources::CourseResource.new(connection: client)
  end

  # Catalog = Resources::CatalogResource.new(client)
  # Course = Resources::CourseResource.new(client)
end
