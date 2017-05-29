import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";
import { receiveTodos, receiveTodo } from './action/todo_actions';
import allTodos from './reducers/selectors';
import App from './components/app';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore;
  ReactDOM.render(<Root store={ store }/>, document.getElementById("content"));

  //for testing
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  window.receiveTodo = receiveTodo;
});
