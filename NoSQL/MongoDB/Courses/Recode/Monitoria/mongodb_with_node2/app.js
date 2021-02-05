const app = require('./src/config/server');
const connection = require('./src/config/connection');
const Produtos = require('./src/models/Produtos');

// SELECT
app.get("/", async (req, res) => {  // É assincrono, então é preciso enviar e esperar
    const resultado = await Produtos.find();
    res.json(resultado);
});

// INSERT com referência em outra collection
app.post("/", async (req, res) => { // É assincrono, então é preciso enviar e esperar
    const { nome, preco, id_usuario } =  req.body; // A data está automática
    let resultado = await Produtos.create({ nome, preco, id_usuario }) // ou nome:nome / preco: preco
     
    res.json(resultado);
});

// UPDATE
app.put("/:id", async (req, res) => {
    const { id } = req.params;
    const  {nome, preco} = req.body;

    let resultado = await Produtos.updateOne({_id:id}, {
        nome, preco
    });

    res.json(resultado);
});


// DELETE
app.delete("/", async (req, res) => { // Pode ser assim /:id" pelo url igual update ou pelo corpo da requisição que é esse caso
    const { id } = req.body;
    
    let resultado = await Produtos.deleteOne({_id:id})// tem o remove() e findByIdAndDelete()
      

    res.json(resultado);
});