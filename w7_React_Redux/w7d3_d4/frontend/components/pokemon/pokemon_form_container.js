import { connect } from 'react-redux';
import { requestNewPokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapDispatchToProps = (dispatch) => ({
  createPokemon: (pokemon) => dispatch(requestNewPokemon(pokemon))
});

export default connect(null, mapDispatchToProps)(PokemonForm);
