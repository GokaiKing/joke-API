import { DataTypes } from "sequelize";
import sequelize from "../db.js";

const Author = sequelize.define('Author',{
    id: {
        type: DataTypes.INTEGER(10),
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING(20),
        allowNull: false
    },
    AI_Generated: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false
    }
}, {
    tableName: 'authors',
    timestamps: false
});

export default Author;