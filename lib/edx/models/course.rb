module Edx
  module Models
    class Course
      include Virtus.model

      attribute :key, String
      attribute :title, String
      attribute :short_description, String
      attribute :full_description, String
      attribute :level_type, String # TODO: scope this to the enum?
      attribute :subjects, Array[String]
      attribute :prerequisites, Array[String]
      # attribute :expected_learning_items, Array[Object] # apparently this is TBA http://course-catalog-api-guide.readthedocs.io/en/latest/course_catalog/catalog.html#id9
      attribute :image, Image
      attribute :video, Video
      attribute :entitlements, Array[String]
      attribute :owners, Array[Organization]
      attribute :sponsors, Array[Organization]
      attribute :modified, DateTime
      attribute :course_runs, Array[CourseRun]
      attribute :marketing_url, String
    end

    def id
      key
    end
  end
end
