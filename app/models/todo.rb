class Todo < ActiveRecord::Base
  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text} #{is_completed} #{due_date.to_s(:long)}"
  end
end
