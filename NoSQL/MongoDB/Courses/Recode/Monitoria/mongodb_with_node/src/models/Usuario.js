// Não precisa criar as tabelas/collections antes
const mongoose = require('mongoose');
const Schema = mongoose.Schema

const Usuario = new Schema({
    nome:{
        type: String,
        required:true
    },
    email:{
        type:String,
        required:true
    },
    senha:{
        type:String,
        required:true
    }
})

// Vai criar a tabela com base no Schema
mongoose.model('usuarios', Usuario);