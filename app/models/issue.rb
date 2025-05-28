class Issue < ApplicationRecord
  belongs_to :project
  

  validates :title, presence: true, length: { minimum: 2 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :priority, presence: true, inclusion: { in: PRIORITIES }


end