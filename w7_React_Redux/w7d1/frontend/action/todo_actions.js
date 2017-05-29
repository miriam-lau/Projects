export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (list) => ({
  type: RECEIVE_TODOS,
  todos: list
});

export const receiveTodo = (item) => ({
  type: RECEIVE_TODO,
  todo: item
});
