class Station < ActiveRecord::Base
  validates :number, { uniqueness: true,
                       presence: true }
  # has_many :lines, through: :stops
end
