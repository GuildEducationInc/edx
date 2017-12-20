module Edx
  module Models
    class CourseRun
      include Virtus.model

      attribute :key, String
      attribute :uuid, String
      attribute :title, String
      attribute :short_description, String
      attribute :full_description, String
      attribute :start, DateTime
      attribute :end, DateTime
      attribute :enrollment_start, DateTime, allow_nil: true
      attribute :enrollment_end, DateTime, allow_nil: true
      attribute :announcement, DateTime
      attribute :image, Image
      attribute :video, Video
      attribute :seats, Array[Seat]
      attribute :content_language, String
      attribute :outcome, String
      attribute :license, String
      attribute :transcript_languages, Array[String]
      attribute :instructors, Array[Person]
      attribute :staff, Array[Person]
      attribute :pacing_type, String # TODO: make this an enum?
      attribute :min_effort, Integer
      attribute :max_effort, Integer
      attribute :weeks_to_complete, Integer
      attribute :modified, DateTime
      attribute :level_type, String
      attribute :availability, String
      attribute :mobile_available, Boolean
      attribute :hidden, Boolean
      attribute :reporting_type, String
      attribute :eligible_for_financial_aid, Boolean
    end
  end
end
