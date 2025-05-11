import Joke from "../models/jokes.model.js";
import Author from "../models/authors.model.js";

// Obtener todas los chistes con información del autor
export const getAllJokes = async (req, res) => {
    try {
        const jokes = await Joke.findAll({
            include: {
                model: Author,
                as: 'author',
                attributes: ['id', 'name']
            }
        });
        res.status(200).json(jokes);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al obtener las bromas',
            error: error.message 
        });
    }
};

// Obtener una chiste por ID con información del autor
export const getJokeById = async (req, res) => {
    try {
        const { id } = req.params;
        
        const joke = await Joke.findByPk(id, {
            include: {
                model: Author,
                as: 'author',
                attributes: ['id', 'name']
            }
        });

        if (!joke) {
            return res.status(404).json({ message: 'Broma no encontrada' });
        }

        res.status(200).json(joke);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al obtener la broma',
            error: error.message 
        });
    }
};

// Crear un nuevo chiste
export const createJoke = async (req, res) => {
    try {
        const { content, authorId, rating } = req.body;

        // Validar que el autor exista
        const authorExists = await Author.findByPk(authorId);
        if (!authorExists) {
            return res.status(400).json({ message: 'El autor especificado no existe' });
        }

        const newJoke = await Joke.create({
            content,
            authorId,
            rating
        });

        // Obtener el chiste creado con la información del autor
        const createdJoke = await Joke.findByPk(newJoke.id, {
            include: {
                model: Author,
                as: 'author',
                attributes: ['id', 'name']
            }
        });

        res.status(201).json(createdJoke);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al crear la broma',
            error: error.message 
        });
    }
};

// Actualizar completamente un chiste (PUT)
export const updateJoke = async (req, res) => {
    try {
        const { id } = req.params;
        const { content, authorId, rating } = req.body;

        const joke = await Joke.findByPk(id);
        if (!joke) {
            return res.status(404).json({ message: 'Broma no encontrada' });
        }

        // Validar que el nuevo autor exista si se proporciona
        if (authorId) {
            const authorExists = await Author.findByPk(authorId);
            if (!authorExists) {
                return res.status(400).json({ message: 'El autor especificado no existe' });
            }
        }

        // Actualizar
        await joke.update({
            content,
            authorId: authorId || joke.authorId,
            rating
        });

        // Obtener el chiste actualizado
        const updatedJoke = await Joke.findByPk(id, {
            include: {
                model: Author,
                as: 'author',
                attributes: ['id', 'name']
            }
        });

        res.status(200).json(updatedJoke);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al actualizar la broma',
            error: error.message 
        });
    }
};

// Actualizar parcialmente un chiste (PATCH)
export const patchJoke = async (req, res) => {
    try {
        const { id } = req.params;
        const updates = req.body;

        const joke = await Joke.findByPk(id);
        if (!joke) {
            return res.status(404).json({ message: 'Broma no encontrada' });
        }

        // Validar que el nuevo autor exista si se proporciona
        if (updates.authorId) {
            const authorExists = await Author.findByPk(updates.authorId);
            if (!authorExists) {
                return res.status(400).json({ message: 'El autor especificado no existe' });
            }
        }

        // Aplicar las actualizaciones
        await joke.update(updates);

        // Obtener el chiste actualizado con la información del autor
        const patchedJoke = await Joke.findByPk(id, {
            include: {
                model: Author,
                as: 'author',
                attributes: ['id', 'name']
            }
        });

        res.status(200).json(patchedJoke);
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al actualizar la broma',
            error: error.message 
        });
    }
};

// Eliminar un chiste
export const deleteJoke = async (req, res) => {
    try {
        const { id } = req.params;

        const joke = await Joke.findByPk(id);
        if (!joke) {
            return res.status(404).json({ message: 'Broma no encontrada' });
        }

        await joke.destroy();
        res.status(204).end();
    } catch (error) {
        res.status(500).json({ 
            message: 'Error al eliminar la broma',
            error: error.message 
        });
    }
};