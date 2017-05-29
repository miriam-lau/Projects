import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { HashRouter, Route } from 'react-router-dom';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container';

const Pokedex = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <Route path="/" component={ PokemonIndexContainer } />
    </HashRouter>
  </Provider>
);

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Pokedex store={store}/>, rootEl);
});
