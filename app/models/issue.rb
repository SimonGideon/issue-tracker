class Issue < ApplicationRecord
  belongs_to :project
  
  STATUSES = ['New', 'In Progress', 'Closed'].freeze
  PRIORITIES = (1..5).to_a.freeze

  validates :title, presence: true, length: { minimum: 2 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :priority, presence: true, inclusion: { in: PRIORITIES }

  scope :by_status, ->(status) { where(status: status) }
  scope :by_priority, ->(priority) { where(priority: priority) }
  scope :recent, -> { order(created_at: :desc) }

  def priority_label
    case priority
    when 1 then 'Very Low'
    when 2 then 'Low'
    when 3 then 'Medium'
    when 4 then 'High'
    when 5 then 'Critical'
    end
  end

  def status_color
    case status
    when 'New' then 'blue'
    when 'In Progress' then 'orange'
    when 'Closed' then 'green'
    end
  end
end