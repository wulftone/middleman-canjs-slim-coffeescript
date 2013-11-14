can.Component.extend


  tag: 'todos-list'


  template: can.view 'todos-list-template'


  scope:


    editTodo: (todo, el) ->
      console.log 'editing now'
      todo.attr 'editing', true
      el.closest('li').find('.edit').focus() # brittle, crappy


    inputTodo: ->
      console.log 'input fired'


    updateTodo: (todo, el, event) ->
      console.log 'updateTodo fired'
      todo.attr
        editing: false
        name: el.val()
