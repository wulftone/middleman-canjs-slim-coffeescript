can.fixture
  "GET /services/todos": ->
    [
      name: "walk the dog"
      completed: true
      id: 1
    ,
      name: "learn canjs"
      completed: false
      id: 2
    ,
      name: "dishes"
      completed: true
      id: 3
    ]

  "POST /services/todos": ->
    console.log 'creating new todo with ID =', id = Math.random()
    id: id

  "DELETE /services/todos/{id}": ->
    console.log 'deleting'
    {}
