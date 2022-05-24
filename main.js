const express = require("express"); //import express package
const database = require("./database"); //initialize database connection. ./ for same folder

//cors policy
const cors = require("cors"); //added cors

app = express();
app.use(cors());  //added cors
app.use(express.json());

router = express.Router();

//GET API
router.get("/users/all", (request, response) => {
    database.connection.query("select * from users", (errors, records) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Something Wrong happened in the Server");
      } else {
        response.status(200).send(records);
      }
    })
  });
    
//POST API
router.post("/users/add", (request, response) => {
  database.connection.query(
    `insert into 
      users (username, user_email, user_dob) 
    values 
      ("${request.body.name}", "${request.body.email}", "${request.body.dob}")`,
    (errors, records) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Something wrong happened in the Server");
      } else {
        response.status(200).send("User added!");
      }
    }
  );
});

////DELETE API
router.delete("/users/delete", (request, response) => {
  database.connection.query(
    `delete from users
    where
      user_id = "${request.query.user_id}"`, //query from body
    (errors, records) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Something wrong happened in the Server");
      } else {
        response.status(200).send("User deleted!");
      }
    }
  );
});

app.use(router);

app.listen(3000, (errors) => {
  if (errors) {
    console.log(errors);
  } else {
    console.log("Server started at port 3000.");
  }
});
