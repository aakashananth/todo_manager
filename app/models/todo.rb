class Todo < ActiveRecord::Base
  validates :todo_text, :due_date, presence: true
  belongs_to :user

  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text} #{is_completed} #{due_date.to_s(:long)}"
  end

  def self.overdue
    where("due_date < ? and completed= ?", Date.today, false)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.due_today
    where("due_date= ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end
end
