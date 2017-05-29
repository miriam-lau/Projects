import React from 'react';
import ItemDetailContainer from './item_detail_container';
import { Route, Link } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const pokemonDetail = this.props.pokemonDetail;
    const id = this.props.match.params.pokemonId;
    return(
      <section className='PokemonDetail'>
        <img src={pokemonDetail.image_url} />
        <h1>{pokemonDetail.name}</h1>
        <ul>
          <li>Type: {pokemonDetail.poke_type}</li>
          <li>Attack: {pokemonDetail.attack}</li>
          <li>Defense: {pokemonDetail.defense}</li>
          <li>Attacks: {pokemonDetail.moves.join(", ")}</li>
          <section>
            <ul>
              {pokemonDetail.items.map((item, idx) => (
                <Link key={idx} to={`/pokemon/${id}/item/${item.id}`}>
                  <img src={item.image_url} />
                </Link>
                )
              )}
            </ul>
            <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer } />
          </section>
        </ul>
      </section>
    );
  }
}

export default PokemonDetail;
