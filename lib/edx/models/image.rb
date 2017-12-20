module Edx
  module Models
    class Image
      include Virtus.model

      attribute :src, String
      attribute :description, String, allow_nil: true
      attribute :height, Integer
      attribute :width, Integer
    end
  end
end
