const mongose = require("mongoose");

function connection(){
    mongose.connect("mongodb://localhost/ecommerce",
    { useNewUrlParser:true, useUnifiedTopology:true})
    .then( () => {
        console.log("MongoDB conectou com sucesso!");
    })
    .catch( (e) =>{
        console.log(e)
    })
}

module.exports = connection();