const express = require('express');
const app = express();
app.use(express.json());

const port = 5006;
app.listen(port, () =>{
    console.log("http://localhost:"+port);
});

module.exports = app;