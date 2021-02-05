const express = require('express');
const app = express();

//intermediador do MongoDB
const mongoose = require('mongoose');

app.use(express.json());

//models - moogose - intermediador do MongoDB
require('./src/models/Usuario');
const Usuario = mongoose.model('usuarios');

const bcrypt = require('bcryptjs');


//conexao db
require('./src/db/connect')


//routes
app.get('/usuarios', async (req, res) =>{
    const usuarioResponse = await Usuario.find(); // promessa -  Similar ao SELECT
    const usuarioJson = await usuarioResponse
    
    return res.json(usuarioJson)
});


app.post('/usuarios', async(req, res) => {

    if( req.body.nome === null || req.body.nome === "" || req.body.email === null || req.body.email === "" || req.body.senha === null || req.body.senha === ""){
        return res.json({message:"Dados inválidos!"})
    }

    const validate = await Usuario.findOne({email:req.body.email})
    
    if(validate){
        return res.json({message: "Já existe um usuário com este e-mail. Tente outro."})
    }else{
             const novoUsuario = new Usuario({
            nome: req.body.nome,
            email: req.body.email,
            senha: req.body.senha
        });

        bcrypt.genSalt(10,(error, salt) => {
            // Gerando nosso hash com o salt
            bcrypt.hash(novoUsuario.senha, salt,(error, hash) =>{
                if(error){
                    res.json({message:"Erro ao cadastrar o Usuario"})
                }else{
                    // Efetivamente colocando o hash na nossa senha
                    novoUsuario.senha = hash;
                    novoUsuario.save();
                    res.json({message:"Cadastro Concluído com Sucesso", usuario:novoUsuario})
                }
            })
        });

        
        
    }
});

                    //http://localhost:3333/usuarios/fulano@gmail
app.put('/usuarios/:index', async (req, res) =>{ // É necessário ser assincrono, pois vai procurar de forma simultânea
    
    const { index } = req.params; 

    // Pesquisando por um usuário
    const usuario = await Usuario.findOne({_id:index}); // pode usar o email, pois o id do mongoDB é um pouco complicado, mas tem como pegar de forma mais prática

    // Verificar se há o email
    const validate = await Usuario.findOne({email:req.body.email})
    if(validate){
        return res.json({message: "Já existe um usuário com este e-mail. Tente outro."})
    }

    // Alterando os dados existentes    
    usuario.nome = req.body.nome;
    usuario.email = req.body.email;
    usuario.senha = req.body.senha;

    // Salvando alteração
    usuario.save()
    res.json({message: "Usuario Alterado."});
    
});


    app.delete('/usuarios/:index', async (req, res) =>{
        const { index } = req.params;
        const usuario = await Usuario.findOneAndDelete({_id:index});

        res.json({message:"Usuario deletado com sucesso", usuario: usuario})
    });


app.listen(3333, () =>{
    console.log('Servidor!');
})