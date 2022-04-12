class Todo < ApplicationRecord
  belongs_to :user

  def self.of_user user_id
    where(user_id: user_id)
  end

  def to_displayable_string
    display_status = completed ? "[x]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where(["due_date < ?", Date.today])
  end

  def self.due_today
    where(["due_date =?", Date.today])
  end

  def self.due_later
    where(["due_date >?", Date.today])
  end

  def self.completed
    where(["completed =?", true])
  end

  def self.incomplete
    where(["completed =?", false])
  end

end