const { Schema, model } = require('mongoose');

const ProdutoSchema = new Schema({
    nome:{
        type: String
    },
    preco:{
        type: Number
    },
    id_usuario:{
        type: Schema.Types.ObjectId,
        ref: "usuarios"
    },
    data_registro: {
        type: Date,
        default: new Date()
    }
});

modelo = model("produtos", ProdutoSchema);

module.exports = modelo;