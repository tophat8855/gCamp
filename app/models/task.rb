class Task < ActiveRecord::Base
  validates :description, presence: true
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
end
