module Main
  class TodosController < Volt::ModelController
    before_action do
      require_login('You need to login to access this page')
    end

    model :store

    def add_todo
      _todos << { name: page._new_todo }
      page._new_todo = ''
    end

    def current_todo
      _todos[(params._index || 0).to_i]
    end

    def completed
      _todos.count { |todo| todo._completed }
    end

    def complete_all
      _todos.each { |todo| todo._completed = true }
    end

    def clear_completed
      _todos.select { |todo| todo._completed }.each(&:destroy)
    end

    def incomplete
      _todos.size - completed
    end

    def percent_complete
      (completed / _todos.size.to_f * 100).round
    end
  end
end
