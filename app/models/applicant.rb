class Applicant < ApplicationRecord
  validates :name , presence: true
  validates :email, uniqueness: true ,format: {with: /[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+/} , presence: true
  
end
