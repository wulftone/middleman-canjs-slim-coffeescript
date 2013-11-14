Agg.Todo.List = Agg.Todo.List.extend


  activeCount: ->
    count = 0

    @each (todo) ->
      count++ unless todo.attr 'completed'

    count


  active: ->
    list = new Agg.Todo.List
    @each (todo) ->
      unless todo.attr 'completed'
        list.push todo

    list


  completed: ->
    list = new Agg.Todo.List
    @each (todo) ->
      if todo.attr 'completed'
        list.push todo

    list
