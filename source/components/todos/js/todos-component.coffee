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
      todos.each (todo) ->
        todo.destroy() # This might make multiple calls to the server, which wouldn't be ideal.


  events:
    "{Agg.Todo} created": (Todo, ev, newTodo) ->
      @scope.attr("todos").unshift newTodo


  helpers:
    filterLink: (text, filter) ->
      attrs = {}
      attrs.filter = filter if filter

      className = if can.route.attr("filter") == filter then "selected" else ""

      can.route.link text, attrs,
        className: className
