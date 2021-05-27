const operators = ['+', '-', '*', '/'];
const numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
const spaces = [' ', '(', ')'];

function defineOperation(operation, operand1, operand2) {
  if (operation === '+') return Number(operand1) + Number(operand2);
  if (operation === '*') return Number(operand1) * Number(operand2);
  if (operation === '-') return Number(operand1) - Number(operand2);
  if (operation === '/') return Number(operand1) / Number(operand2);
}

function calcExpression(expression, index = 0) {
  let result = undefined;
  for (; index < expression.length; index++) {
    const element = expression[index];
    if (operators.indexOf(element) + 1) {

      if (result !== undefined) {
        break;
      }

      let response = calcExpression(expression, index + 1);
      if (response.error !== undefined) {
        return response;
      }
      let operand1 = response.value;
      index = response.index;

      response = calcExpression(expression, index);
      if (response.error !== undefined) {
        return response;
      }
      let operand2 = response.value;
      index = response.index;
      result = defineOperation(element, operand1, operand2);
      break;
      
    } else if (numbers.indexOf(element) + 1) {
      if (result == undefined) result = '';
      result += element;

    } else if (spaces.indexOf(element) + 1)  {
      if (result !== undefined)  break;
    } else {
      return {error: "Неизвестный символ" + element, index: index};
    }
  }
  return {value: result, index: index}
}

calcExpression('+ 37 + 4 4')