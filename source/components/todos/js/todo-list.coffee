Agg.Todo.List = Agg.Todo.List.extend


  map: (func) ->
    list = new Agg.Todo.List

    @each (el) ->
      list.push el if func(el)

    list


  activeCount: ->
    @active().length


  completedCount: ->
    @completed().length


  active: ->
    @map (todo) ->
      todo unless todo.attr 'completed'


  completed: ->
    @map (todo) ->
      todo if todo.attr 'completed'
