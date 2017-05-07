function DOMNodeCollection(HTMLElements) {
  this.HTMLElements = HTMLElements;
}

DOMNodeCollection.prototype.empty = function() {
  for (let i = 0; i < this.HTMLElements.length; i++) {
    this.HTMLElements[i].innerHTML = "";
  }
};

DOMNodeCollection.prototype.append = function(arg) {
  if (typeof arg === "string") {
    for (let i = 0; i < this.HTMLElements.length; i++) {
      this.HTMLElements[i].innerHTML += arg;
    }
  }
  if (arg instanceof DOMNodeCollection) {
    for (let i = 0; i < this.HTMLElements.length; i++) {
      for (let j = 0; j < arg.HTMLElements.length; j++) {
        this.HTMLElements[i].appendChild(arg.HTMLElements[j]);
      }
    }
  }
};


DOMNodeCollection.prototype.attr = function(attributeName) {
  for (let i = 0; i < this.HTMLElements.length; i++) {
    if (this.HTMLElements[i].attributes[attributeName] !== undefined) {
      return this.HTMLElements[i].attributes[attributeName].value;
    }
  }
};

DOMNodeCollection.prototype.addClass = function(name) {
  for (let i = 0; i < this.HTMLElements.length; i++) {
    this.HTMLElements[i].className = name;
  }
};

DOMNodeCollection.prototype.removeClass = function(name) {
  if (name !== undefined) {
    for (let i = 0; i < this.HTMLElements.length; i++) {
      if (this.HTMLElements[i].className === name) {
        this.HTMLElements[i].className = "";
      }
    }
  } else {
    for (let i = 0; i < this.HTMLElements.length; i++) {
      this.HTMLElements[i].className = "";
    }
  }
};

DOMNodeCollection.prototype.html = function(str = null) {
  if (str) {
    for (let i = 0; i < this.HTMLElements.length; i++) {
      this.HTMLElements[i].innerHTML = str;
    }
  } else {
    return this.HTMLElements[0].innerHTML;
  }
};

DOMNodeCollection.prototype.children = function() {
  let kids = [];
  debugger;
  for (let i = 0; i < this.HTMLElements.length; i++) {
    if (this.HTMLElements[i].children) {
      kids = kids.concat(this.HTMLElements[i].children);
    }
  }
  return new DOMNodeCollection(kids);
};

DOMNodeCollection.prototype.parent = function() {};

DOMNodeCollection.prototype.find = function() {};

DOMNodeCollection.prototype.remove = function() {};

module.exports = DOMNodeCollection;
