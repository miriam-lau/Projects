//React
import React from 'react';
import ReactDOM from 'react-dom';
//Components
import Root from './components/root';
//Store
import configureStore from './store/store';


document.addEventListener('DOMContentLoaded', () => {

  let store;

  if (window.currentUser){
    const preloadedState = { session: { currentUser: window.currentUser, errors: [] } };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  window.store = store;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
