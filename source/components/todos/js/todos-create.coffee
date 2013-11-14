can.Component.extend


  tag: 'todos-create'


  template: can.view 'todos-create-template'


  scope:
    createTodo: (context, el, event) ->
      console.log 'creating todo'
      # save the todo
      new Agg.Todo
        completed: false
        name: el.val()
      .save()

      el.val '' # reset the input field to blank
