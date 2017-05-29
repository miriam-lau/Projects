import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './frontend/clock';
import Weather from './frontend/weather';

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<div><Clock /><Weather /></div>, root);
});
