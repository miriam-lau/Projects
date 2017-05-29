import React from 'react';

class Clock extends React.Component{
  constructor(props) {
    super(props);
    this.state = { time: new Date() };

    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalID);
  }


  render() {
    const WEEKDAY = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    const MONTH = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
        "Aug", "Sep", "Oct", "Nov", "Dec"];
    const { time } = this.state;
    let day = time.getDate();
    let month = MONTH[time.getMonth()];
    let year = time.getFullYear();
    let weekday = WEEKDAY[time.getDay()];

    let hours = time.getHours();
    let mins = time.getMinutes();
    let secs = time.getSeconds();
    return (
      <div className="parent">
        <h1>Clock</h1>
        <div className = "time">
          <div className="clock">
            <span>Time:</span>
            <span>{hours}:{mins}:{secs}</span>
          </div>

          <div className="clock">
            <span>Date:</span>
            <span>{ weekday } { month } { day } { year }</span>
          </div>
        </div>
      </div>
    );
  }
}

export default Clock;
