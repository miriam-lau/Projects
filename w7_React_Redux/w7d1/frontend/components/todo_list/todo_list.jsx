import React from 'react';

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
        </ul>
      </div>
    );
  }
}

export default TodoList;
