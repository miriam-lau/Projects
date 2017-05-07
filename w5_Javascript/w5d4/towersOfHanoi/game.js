class Game {
  constructor() {
    this.stacks = [ [3, 2, 1], [], [] ];
  }

  isValidMove?(startTowerIdx, endTowerIdx) {
    const start = this.stacks[startTowerIdx];
    const end = this.stacks[endTowerIdx];

    if (start.length === 0) {
      return false;
    } else if (end.length === 0) {
      return true;
    } else if (start[start.length - 1] < end[end.length - 1]) {
      return true;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove?(startTowerIdx, endTowerIdx) === true) {
      const removedDisc = this.stacks[startTowerIdx].pop();
      this.stacks[endTowerIdx].push(removedDisc);
    }
  }

  print() {
    console.log(JSON.stringify(this.stacks));
  }

  isWon() {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    } else {
      return false:
    }
  }
}


const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

Game.prototype.promptMove = function(callback) {
  console.log(`${this.stacks}`);
  reader.question('Where do you want to move a disc from? ', function(fromRes) {
    let startTowerIdx = parseInt(fromRes);
    reader.question('Where do you want to move the disc to? ', function(toRes) {
      let endTowerIdx = parseInt(toRes);
      callback(startTowerIdx, endTowerIdx);
    });
  });
}

Game.prototype.run = function(completionCallBack) {
  this.promptMove(startTowerIdx, endTowerIdx) {
    if (isValidMove?(startTowerIdx, endTowerIdx) === true) {
      move(startTowerIdx, endTowerIdx);
    } else {
      console.log('Move is invalid!');
    }

    if (isWon === false) {
      call game.promptMove again;
    } else {
      game.completionCallBack();
    }
  };
}

let game = new Game();
game.run(cb);

function cb() {
  console.log('You won!');
  reader.close();
}
