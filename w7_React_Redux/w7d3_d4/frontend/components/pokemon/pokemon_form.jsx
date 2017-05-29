import React from 'react';
import { withRouter } from 'react-router-dom';


class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.types = [
      "fire",
      "electric",
      "normal",
      "ghost",
      "psychic",
      "water",
      "bug",
      "dragon",
      "grass",
      "fighting",
      "ice",
      "flying",
      "poison",
      "ground",
      "rock",
      "steel"
    ];
    this.state = {
      name: "",
      attack: 0,
      defense: 0,
      image_url: "",
      move1: "",
      move2: "",
      poke_type: "fire",
      items: [],
      moves: []
    };
  }

  update(property) {
    return e => this.setState({[property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();

    this.setState({moves: [this.state.move1, this.state.move2]});
    this.props.createPokemon(this.state).then((newPokemon) => {
      console.log(newPokemon);
      this.props.history.push(`pokemon/${newPokemon.id}`);
    });
  }

  render() {
    return(
      <form onSubmit={this.handleSubmit.bind(this)}>
        <input
          type="text"
          onChange={this.update('name')}
          placeholder="Name"
          value={this.state.name}>
        </input>
        <input
          type="number"
          onChange={this.update('attack')}
          placeholder="Attack"
          value={this.state.attack}>
        </input>
        <input
          type="number"
          onChange={this.update('defense')}
          placeholder="Defense"
          value={this.state.defense}>
        </input>
        <input
          type="text"
          onChange={this.update('image_url')}
          placeholder="Image Url"
          value={this.state.image_url}>
        </input>
        <input
          type="text"
          onChange={this.update('move1')}
          placeholder="Move 1"
          value={this.state.move1}>
        </input>
        <input
          type="text"
          onChange={this.update('move2')}
          placeholder="Move 2"
          value={this.state.move2}>
        </input>
        <select onChange={this.update('poke_type')} value={this.state.poke_type}>
          {this.types.map((type,idx) => <option key={idx} value={type}>{type}</option>)}
        </select>
        <button>Create Pokemon</button>
      </form>
    );
  }
}

export default withRouter(PokemonForm);
