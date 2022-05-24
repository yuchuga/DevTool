const express = require("express"); //import express package
const database = require("./data"); //initialize database connection. ./ for same folder

app = express();
app.use(express.json());

router = express.Router();

//GET data from database
router.get("/users/all", (req, res) => {
    let users = database.get_all_users();
    res.status(200).send(users);
});

//GET user_id from database
router.get("/users/id", (req, res) => {
    let users = database.get_user_by_user_id(req.query.user_id);   
    res.status(200).send(users);
});

//POST data to body
router.post("/users/add", (request, response) => {
    let user = request.body;
    database.add_user(user);
    response.status(200).send("User added successfully!");
});

app.use(router);

app.listen(3000, (errors) => {
  if (errors) {
    console.log(errors);
  } else {
    console.log("Server started at port 3000.");
  }
});
