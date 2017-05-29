import * as APIUtil from '../util/api_util.js';
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_NEW_POKEMON = "RECEIVE_NEW_POKEMON";

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = (pokemon) => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const receiveNewPokemon = (pokemon) => ({
  type: RECEIVE_NEW_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  return APIUtil.fetchSinglePokemon(pokemonId)
  .then(pokemon => dispatch(receiveSinglePokemon(pokemon)));
};

export const requestNewPokemon = (pokemon) => (dispatch) => (
  APIUtil.sendNewPokemon({pokemon})
  .then(newPokemon => {
      dispatch(receiveNewPokemon(newPokemon));
      return pokemon;
    }
  )
);
