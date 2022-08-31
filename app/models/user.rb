class User < ApplicationRecord
  has_many :items do
    def location(location)
      where(location: location)
    end

    def for_donation
      where(for_donation: true)
    end

  end
end
