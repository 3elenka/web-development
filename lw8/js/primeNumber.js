function isPrimeNumber(checkedItem) {
  if (typeof checkedItem === 'number' || typeof checkedItem === 'object') {
    if (typeof checkedItem === 'number') {
      let isPrime = true;
      for (let i = 2; i < checkedItem; i++) {
        if (checkedItem % i === 0) {
          isPrime = false;
        }
      }
      if (isPrime && checkedItem > 1 && Number.isInteger(checkedItem)) {
        console.log(checkedItem, 'is prime number');
      } else {
        console.log(checkedItem, 'is not prime number');
      }
    } else {
      let len = checkedItem.length;
      for (let i = 0; i < len; i++) {
        isPrimeNumber(checkedItem[i]);
      }
    }
  } else {
    console.log(checkedItem, ' is invalid parameter');
  }
}