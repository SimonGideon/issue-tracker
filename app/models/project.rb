class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    validates :title, presence: true, length: { minimum: 2 }
    validates :description, presence: true
  
    scope :with_issues, -> { joins(:issues).distinct }
    
    def issues_count
      issues.count
    end
  
    def completed_issues_count
      issues.where(status: 'Closed').count
    end
  end