class Dog < ApplicationRecord
    has_many :employees

    def owners
        self.employees.map do |owner|
            owner.first_name + " " + owner.last_name 
        end
    end
end
