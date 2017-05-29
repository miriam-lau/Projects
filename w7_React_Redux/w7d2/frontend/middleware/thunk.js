const thunk = ({dispatch, getState}) => next => action => {
  console.log("next");
  console.log(next);
  console.log("action");
  console.log(action);
  if (typeof action === "function"){
    return action(dispatch, getState);
  }
  return next(action);
};

export default thunk;
