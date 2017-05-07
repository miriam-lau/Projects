/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);