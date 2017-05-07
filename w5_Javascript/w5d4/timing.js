class Clock {
  constructor() {
    let currentTime = new Date();
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  formatTime(value) {
    if (value < 10) {
      return value = `'0${value}'`;
    } else {
      return `${value}`;
    }
  }

  printTime() {
    let formattedHours = this.formatTime(this.hours);
    let formattedMinutes = this.formatTime(this.minutes);
    let formattdSeconds = this.formatTime(this.seconds);
    console.log(`${formattedHours}:${formattedMinutes}:${formattdSeconds}`)
  }

  _tick() {
    this.seconds++;
    this.printTime();
  }
}

const clock = new Clock();
