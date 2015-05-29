# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    model :store

    def add_todo
      _todos << { name: _new_todo }
      _new_todo = ''
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

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
