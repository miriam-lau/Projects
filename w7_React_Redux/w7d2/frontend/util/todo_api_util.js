const APIUtil = () => {
  $.ajax({method: "GET", url: 'api/todos'}).then(success => console.log("successful"), error => console.log("error"));
};

export default APIUtil;
