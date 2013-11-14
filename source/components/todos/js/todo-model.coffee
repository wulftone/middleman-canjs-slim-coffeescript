Agg.Todo = can.Model.extend
  findAll: "GET /services/todos"
  create: "POST /services/todos"
  destroy: "DELETE /services/todos/{id}"
  , {}
