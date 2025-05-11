import Author from "../models/authors.model.js";
import Joke from "../models/jokes.model.js";

// Obtener todos los autores con sus bromas
export const getAllAuthors = async (req, res) => {
    try {
        const authors = await Author.findAll({
            include: {
                model: Joke,
                as: 'jokes',
                attributes: ['id', 'content', 'rating']
            }
        });
        res.status(200).json(authors);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al obtener los autores',
            error: error.message 
        });
    }
};

// Obtener un autor por ID con sus bromas
export const getAuthorById = async (req, res) => {
    try {
        const { id } = req.params;
        
        const author = await Author.findByPk(id, {
            include: {
                model: Joke,
                as: 'jokes',
                attributes: ['id', 'content', 'rating']
            }
        });

        if (!author) {
            return res.status(404).json({ message: 'Autor no encontrado' });
        }

        res.status(200).json(author);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al obtener el autor',
            error: error.message 
        });
    }
};

// Crear un nuevo autor
export const createAuthor = async (req, res) => {
    try {
        const { name, AL_Generated } = req.body;

        const newAuthor = await Author.create({
            name,
            AL_Generated: AL_Generated || false
        });

        res.status(201).json(newAuthor);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al crear el autor',
            error: error.message 
        });
    }
};

// Actualizar completamente un autor (PUT)
export const updateAuthor = async (req, res) => {
    try {
        const { id } = req.params;
        const { name, AL_Generated } = req.body;

        const author = await Author.findByPk(id);
        if (!author) {
            return res.status(404).json({ message: 'Autor no encontrado' });
        }

        await author.update({
            name,
            AL_Generated
        });

        res.status(200).json(author);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al actualizar el autor',
            error: error.message 
        });
    }
};

// Actualizar parcialmente un autor (PATCH)
export const patchAuthor = async (req, res) => {
    try {
        const { id } = req.params;
        const updates = req.body;

        const author = await Author.findByPk(id);
        if (!author) {
            return res.status(404).json({ message: 'Autor no encontrado' });
        }

        await author.update(updates);
        res.status(200).json(author);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al actualizar el autor',
            error: error.message 
        });
    }
};

// Eliminar un autor (y sus bromas asociadas)
export const deleteAuthor = async (req, res) => {
    try {
        const { id } = req.params;

        const author = await Author.findByPk(id);
        if (!author) {
            return res.status(404).json({ message: 'Autor no encontrado' });
        }

        // Eliminar primero las bromas asociadas para mantener la integridad referencial
        await Joke.destroy({
            where: { authorId: id }
        });

        await author.destroy();
        res.status(204).end();
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al eliminar el autor',
            error: error.message 
        });
    }
};