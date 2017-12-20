module Edx
  module Models
    class Person
      include Virtus.model

      attribute :uuid, String
      attribute :given_name, String
      attribute :family_name, String
      attribute :email, String
      attribute :slug, String
      attribute :position, Hash
      attribute :bio, String
      attribute :profile_image, Image
      attribute :urls, Hash
      attribute :works, Array[String]

      def title
        position['title']
      end
    end
  end
end
