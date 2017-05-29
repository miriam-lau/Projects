import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map((poke, idx) => <PokemonIndexItem key={idx} pokemon={poke} />);
    return(
      <section className='pokedex'>
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
        <Route exact path='/pokemon' component={PokemonFormContainer} />
        <ul>
          {pokemonItems}
        </ul>
      </section>
    );
  }
}

export default PokemonIndex;
