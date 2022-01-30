// function is_leap_year(year) {
//   if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
//     return true;
//   } else {
//     return false;
//   }
// }

// console.log(is_leap_year(2022));

// function A(x, Y) { // Y is a callback function
//   x==12; Y==B
//   console.log("Received value: %s", x);
//   Y(x); // B(12)
// }

// function B(c) {
//   c == 12;
//   console.log(2 * c); // 24
// }

// function C()

// A(12, B);

// normal function
// function A(a) {
//   console.log(a);
// }

// anonymous function
// A = function (a) {
//   console.log(a);
// };

// arrow function or lambda functions
// A = (a) => {
//   console.log(a);
// };

// function print(x, power) {
//   console.log("Value of x: ", x);
//   power(x);
//   square(x);
// }

// function square(a) {
//   console.log("Square: ", a * a);
// }

// function cube(a) {
//   console.log("Cube: ", a * a * a);
// }

// print(2, cube);

// ForEach function
// let names = ["Dixant", "Jon", "Remya", "Bee Bee"];
// names.forEach((x) => {
//   console.log("Hi, %s !", x); //%s is placeholder
// });

let numbers = [1, 2, 3, 4, 5, 6];
product = 1;
numbers.forEach((x) => {
  product = product * x;
});
console.log("Product: %s, 2x Product: %s", product, product * 2);

//Object
let info = {
    first_name: "Dixant",
    last_name: "Mittal",
    school: "NUS Computing",
};

console.log(info["school"]);
  