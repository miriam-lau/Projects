import React from 'react';
import TodoList from './todo_list/todo_list';
import TodoListContainer from './todo_list/todo_list_container';

const App = () => (
  <div>
    <h1>Todo List</h1>
    <TodoListContainer />
  </div>
);

export default App;
