const mongoose = require('mongoose');

function connect(){
    mongoose.connect('mongodb://localhost:27017/monitoriarj', 
    {useNewUrlParser: true,
     useUnifiedTopology: true})
    .then( () => {
        console.log("Conectado com o Banco 'Recode'")
    }).catch( (error) =>{
        console.log(`Erro ao tentar a conexão ${error}`);
    });
}

module.exports = connect();