class Department < ApplicationRecord
  audited
  has_many :ar_classes
  belongs_to :organization
  validates_presence_of :name
  validates_uniqueness_of :name
end
