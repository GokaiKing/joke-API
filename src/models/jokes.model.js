import { DataTypes } from "sequelize";
import sequelize from "../db.js";

const Joke = sequelize.define('Joke',{
    id: {
        type: DataTypes.INTEGER(10),
        autoIncrement: true,
        primaryKey: true
    },
    content: {
        type: DataTypes.STRING(200),
        allowNull: false
    },
    authorId: {
        type: DataTypes.INTEGER(10),
        allowNull: false,
        references: {
            model: 'Author',
            key: 'id'
        }
    },
    rating: {
        type: DataTypes.INTEGER(2),
        allowNull: false
    }
}, {
    tableName: 'jokes',
    timestamps: false
});

export default Joke;