module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" :"asc"

    if params[:type] == 'incomplete'
      link_to title, :sort => column, :direction => direction, :type => 'incomplete'
    else
      link_to title, :sort => column, :direction => direction
    end
  end

end
