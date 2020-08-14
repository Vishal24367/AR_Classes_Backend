class Student < ApplicationRecord
    audited
    belongs_to :ar_class
    validates :name, presence: true, uniqueness: true 
end
