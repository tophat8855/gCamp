class Task < ActiveRecord::Base
  belongs_to :project
  validates :description, presence: true
  validate :due_date_plausible

  def index
    @tasks = Task.all
    
  end

  def due_date_plausible
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "must be today or later")
    end
  end
end
