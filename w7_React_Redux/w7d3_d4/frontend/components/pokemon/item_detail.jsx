import React from 'react';

const itemDetail = ({item}) => {
  return (
    <section className="ItemDetail">
      <h2>{item.name}</h2>
      <ul>
        <li>Happiness: {item.happiness}</li>
        <li>Price: ${item.price}</li>
      </ul>
    </section>
  );
};

export default itemDetail;
