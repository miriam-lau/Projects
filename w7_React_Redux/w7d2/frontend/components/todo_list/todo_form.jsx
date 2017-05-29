import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: ""};
    this.handleTitle = this.handleTitle.bind(this);
    this.handleBody = this.handleBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitle(event) {
    // console.log(event);
    this.setState({ title: event.currentTarget.value });
  }

  handleBody(event) {
    this.setState({ body: event.currentTarget.value });
  }

  handleSubmit(event) {
    // debugger;
    event.preventDefault();
    const todo = Object.assign({}, this.state);
    this.props.receiveTodo(todo);
    this.setState = {title: "", body: ""};
  }

  render() {

    return(
    <form onSubmit={this.handleSubmit}>
      <label>Title:</label>
      <input onChange={this.handleTitle} name="title"
         type="text" placeholder="buy milk" value={this.state.title}>
      </input>
        <br/>
      <label>Body:</label>
      <input onChange={this.handleBody} name="body"
         type="text" placeholder="make sure it is 2% milk" value={this.state.body}>
      </input>
      <button>Create Todo!</button>
    </form>
    );
  }
}

export default TodoForm;
