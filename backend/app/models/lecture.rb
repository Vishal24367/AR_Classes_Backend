class Lecture < ApplicationRecord
    audited
    belongs_to :ar_class
end
