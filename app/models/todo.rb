class Todo < ApplicationRecord

  def to_displayable_string
    display_status = completed ? "[x]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def due_today?
    due_date == Date.today
  end

  # def self.add_task args
  #   Todo.create(todo_text: args[:todo_text], due_date: Date.today + args[:due_in_days], completed: false)
  # end

  def self.mark_as_complete todo_id
    todo = Todo.find(todo_id)
    todo.update(completed: true) if todo.present?
    return todo
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
    where(["completed >?", true])
  end

end