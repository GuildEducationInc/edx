module Edx
  module Models
    class Video
      include Virtus.model

      attribute :src, String
      attribute :description, String, allow_nil: true
      attribute :image, Image
    end
  end
end
