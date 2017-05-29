import React from 'react';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.todos.map( (todo, idx) => (
            <li key={idx}>{todo.title}</li>
          ))}
          <TodoForm receiveTodo={this.props.receiveTodo}/>
        </ul>
      </div>
    );
  }
}

export default TodoList;
