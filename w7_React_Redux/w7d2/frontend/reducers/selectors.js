const allTodos = (state) => {
  let toDoArray = [];
  let keys = Object.keys(state.todos);
  keys.forEach( (k) => {
    toDoArray.push(state.todos[k]);
  });
  return toDoArray;
};

export default allTodos;

// returned = [
//   [1:{
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   }],
//   [2:{
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   }]
// ]
