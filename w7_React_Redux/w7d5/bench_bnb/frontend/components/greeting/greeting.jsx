import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({currentUser, logout}) => {
  if (currentUser) {
    return (
      <div>
        <h1>Welcome {currentUser.username}</h1>
        <br />
        <button onClick= {logout}>Log Out</button>
      </div>
    );
  } else {
    return (
      <div>
        <Link to='/signup' >Sign Up</Link>
        <br />
        <Link to='/login' >Login</Link>
      </div>
    );
  }

};

export default Greeting;
