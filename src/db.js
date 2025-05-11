import { DB_USER, DB_PASSWORD, DB_HOST, DB_NAME, DB_PORT } from "./config.js";
import { Sequelize } from "sequelize";

const sequelize = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
host: DB_HOST,
dialect: 'mysql'
});

try{
    await sequelize.authenticate();
    console.log("Conexion exitosa");
}catch(error){
    console.error("No se pudo conectar a la base de datos: ", error);
}

export default sequelize;