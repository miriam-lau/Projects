const DOMNodeCollection = require('./dom_node_collection');

window.$l = function(selector) {
  let NodeList;
  let newElements;
  if (typeof selector === "string") {
    NodeList = document.getElementsByTagName(selector);
    newElements = new DOMNodeCollection(NodeList);
  } else if (selector instanceof HTMLElement) {
    newElements = new DOMNodeCollection([selector]);
  }
  return newElements;
};
