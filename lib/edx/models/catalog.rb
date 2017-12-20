module Edx
  module Models
    class Catalog
      include Virtus.model

      attribute :id, Integer
      attribute :name, String
      attribute :query, String
      attribute :courses_count, Integer
      attribute :viewers, Array[String]
    end
  end
end
