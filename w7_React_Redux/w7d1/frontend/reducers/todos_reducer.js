import { RECEIVE_TODOS, RECEIVE_TODO } from '../action/todo_actions';
import merge from 'lodash/merge';

// const _defaultState = {
//   todos: {1:"buy milk"},
// };

// const _defaultState = "TESTING";

const _defaultState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;
        // return merge(state.todos, ...action.todos);
    case RECEIVE_TODO:
      const newState1 = merge({}, state);
      newState1[action.todo.id] = action.todo;
      return newState1;
    default:
      return state;
  }
};

export default todosReducer;
