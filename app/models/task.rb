class Task < ActiveRecord::Base
  validates :description, presence: true
  validate :due_date_plausible

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"task-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def due_date_plausible
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "must be today or later")
    end
  end
end
