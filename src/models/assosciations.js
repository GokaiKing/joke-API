import Joke from "./jokes.model.js";
import Author from "./authors.model.js";

Joke.belongsTo(Author, {
    foreignKey: 'authorId',
    targetKey: 'id',
    as:  'author'
});

Author.hasMany(Joke, {
    foreignKey: 'authorId',
    as: 'jokes'
});