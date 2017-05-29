import APIUtil from "../util/todo_api_util";

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (list) => ({
  type: RECEIVE_TODOS,
  todos: list
});

export const receiveTodo = (item) => ({
  type: RECEIVE_TODO,
  todo: item
});

export const removeTodo = (item) => ({
  type: REMOVE_TODO,
  todo: item
});

const fetchTodos = (dispatch) => (
   APIUtil()
);

export { fetchTodos };
