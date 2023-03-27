class Vaccine < ApplicationRecord
    belongs_to :person
    validates :vaccine_type, presence: true
end
