const mysql = require("mysql");

let details = {
  host: "137.132.92.94",
  port: 12865,
  user: "fintechlab",
  password: "FinTechLab",
  database: "b15_yuchuga",
};

let connection = mysql.createConnection(details);
connection.connect((error) => {
  if (error) {
    console.log(error);
  } else {
    console.log("Connected to MySQL");
  }
});

module.exports = { connection };
