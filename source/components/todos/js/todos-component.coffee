#=require ./todo-model
#=require ./todo-list
#=require_tree .

can.Component.extend


  tag: 'todos'


  scope:


    todos: new Agg.Todo.List {}


    todosToShow: ->
      todos = @attr "todos"
      filter = can.route.attr 'filter'

      if filter == 'active'
        return todos.active()

      else if filter == 'completed'
        return todos.completed()

      else
        return todos


    clearCompletedTodos: ->
      todos = @attr("todos").completed()
      todos.destroy()


    toggleAllTodos: (context, el, e) ->
      state = el.is ':checked'
      todos = @attr "todos"

      todos.each (todo) ->
        todo.attr 'completed', state


  events:
    "{Agg.Todo} created": (Todo, e, newTodo) ->
      # Put the new todo at the top of the list
      @scope.attr("todos").unshift newTodo


  helpers:
    filterLink: (text, filter) ->
      attrs = {}
      attrs.filter = filter if filter

      className = if can.route.attr("filter") == filter then "selected" else ""

      can.route.link text, attrs,
        className: className
