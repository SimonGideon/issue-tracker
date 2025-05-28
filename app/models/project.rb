class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    validates :title, presence: true, length: { minimum: 2 }
    validates :description, presence: true


  end
