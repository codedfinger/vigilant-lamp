const express = require("express");
const app = express();
 

 
app.get("/", (req, res) => {
  res.send("Welcome Onboard!");
  console.log("welcome url /");
});
 
app.get("/profile", (req, res) => {
  res.json({
    myFavouriteColor: "Black"
  });
  console.log("DELETE user");
});
 
// app.get("/create", (req, res) => {
//   res.send("User was created!!");
//   console.log("CREATE user");
// });

app.listen(5001, function () {
    console.log("listening on 5000");
  });