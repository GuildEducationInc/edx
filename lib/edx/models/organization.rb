module Edx
  module Models
    class Organization
      include Virtus.model

      attribute :key, String
      attribute :name, String
      attribute :description, String, allow_nil: true
      attribute :logo_image, Array[Image]
      attribute :homepage_url, String
    end
  end
end
