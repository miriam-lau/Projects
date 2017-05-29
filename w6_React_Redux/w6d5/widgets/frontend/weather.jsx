import React from 'react';

class Weather extends React.Component{
  constructor(props) {
    super(props);
    this.state = {location: "", temperature:""};
  }

  componentDidMount() {
    let location = navigator.geolocation;
    location.getCurrentPosition((position) => {
      let lat = position.coords.latitude;
      let long = position.coords.longitude;

      var request = new XMLHttpRequest();
      let coords = 'http://api.openweathermap.org/data/2.5/weather?'+
      `lat=${lat}`+ `&lon=${long}`;

      let apiKey = '9542780fef00ae32a655f57e74aef629';
      coords += `&APPID=${apiKey}`;

      request.open('GET', coords, true);

      request.onload = function() {
        if (request.status >= 200 && request.status < 400){
          let resp = JSON.parse(request.response);
          console.log(resp.name);
          console.log(resp.main.temp);
        }
      };
      request.send();
    });
    this.setState({ location: location });
  }

  render() {
    return (
      <div>
        <h1>Weather</h1>
      </div>
    );
  }
}

export default Weather;
