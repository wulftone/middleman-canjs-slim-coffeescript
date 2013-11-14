Agg.Todo.List = Agg.Todo.List.extend


  activeCount: ->
    @active().length


  completedCount: ->
    @completed().length


  active: ->
    @filter (todo) ->
      todo unless todo.attr 'completed'


  completed: ->
    @filter (todo) ->
      todo if todo.attr 'completed'
