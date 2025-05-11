import express from 'express';
import routerChistes from './routes/jokes.routes.js';
import routerAutores from './routes/authors.routes.js';
import './models/assosciations.js';
import './config.js';
import './db.js';
import sequelize from './db.js';

await sequelize.sync({force: false});
console.log("Todos los mdoelos fueron sincronizados correctamente");

const app = express();
const port = process.env.PORT || 3002;

app.use(express.json());

app.use('/jokes', routerChistes);
app.use('/authors', routerAutores);

//app.use(express.json());

app.listen(port, () => console.log("jalando en el puerto " + port));