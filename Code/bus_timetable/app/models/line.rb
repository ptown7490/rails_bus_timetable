class Line < ActiveRecord::Base
  validates :number, { uniqueness: true,
                       presence: true }
  has_many :stops
  has_many :stations, { through: :stops }
end
