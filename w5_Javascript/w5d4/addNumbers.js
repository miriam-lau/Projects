const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Input a number: ", function(response) {
      let newNumber = parseInt(response);
      sum += newNumber;
      console.log(`'New sum is ${sum}'`);
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else if (numsLeft === 0) {
    completionCallback(sum);
  }
}

addNumbers(0, 3, function(sum) {
  console.log(`Total Sum: ${sum}`);
  reader.close();
});
