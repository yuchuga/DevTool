const express = require("express");

let app = express();
app.use(express.json()); //pass in json format to body

let router = express.Router();

//API GET Method
router.get("/", (request, response) => {   //localhost:3000
    response.status(200).send("Hello World!");
});

router.get("/special", (req, res) => { //localhost:3000/special
    res.status(200).send("HELLO WORLD!");
});

router.get("/person", (req, res) => { 
    res.status(200).send(`Hello, ${req.query.name}`);
});

//API POST Method
//first_name in Postman body
router.post("/input", (req, res) => {
    res.status(200).send(
        `First name: ${req.body.first_name} | Last name: ${req.body.last_name}`
    );
});

app.use(router); //run router

app.listen(3000, (error) => {
    if (error){
        console.log(error);
    } else {
        console.log("Server running at port 3000.");
    }
});
