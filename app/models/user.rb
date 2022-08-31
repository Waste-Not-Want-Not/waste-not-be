class User < ApplicationRecord
  has_many :items do
    def location(location)
      where(location: location)
    end
  end
end
