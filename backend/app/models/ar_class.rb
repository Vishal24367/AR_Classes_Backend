class ArClass < ApplicationRecord
    audited
    has_many :employee_roles
    has_many :employees, through: :employee_roles
    has_many :roles, through: :employee_roles
    has_many :students
    has_many :lectures
    belongs_to :department
    belongs_to :organization
    validates :name, presence: true, uniqueness: true  
end
