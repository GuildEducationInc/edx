module Edx
  module Models
    class Seat
      include Virtus.model

      attribute :type, String
      attribute :price, String
      attribute :currency, String
      attribute :upgrade_deadline, String
      attribute :credit_provider, String
      attribute :credit_hours, Integer
      attribute :sku, String
    end
  end
end
