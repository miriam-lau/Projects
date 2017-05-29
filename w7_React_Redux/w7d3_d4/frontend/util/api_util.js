export const fetchAllPokemon = () => {
  return(
    $.ajax({
      method: 'GET',
      url: '/api/pokemon'
    })
  );
};

export const fetchSinglePokemon = (pokemonId) => {
  return(
    $.ajax({
      method: 'GET',
      url: `/api/pokemon/${pokemonId}`
    })
  );
};

export const sendNewPokemon = (pokemon) => {
  return(
    $.ajax({
      method: 'POST',
      url: '/api/pokemon',
      data: pokemon
    })
  );
};
