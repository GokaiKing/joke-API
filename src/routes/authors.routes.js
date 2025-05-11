// src/routes/authors.routes.js
import express from 'express';
import {
  getAllAuthors,
  getAuthorById,
  createAuthor,
  updateAuthor,
  patchAuthor,
  deleteAuthor
} from '../controllers/authors.controller.js';

const router = express.Router();

// GET /api/authors - Obtener todos los autores
router.get('/', getAllAuthors);

// GET /api/authors/:id - Obtener un autor por ID
router.get('/:id', getAuthorById);

// POST /api/authors - Crear un nuevo autor
router.post('/', createAuthor);

// PUT /api/authors/:id - Actualizar completamente un autor
router.put('/:id', updateAuthor);

// PATCH /api/authors/:id - Actualizar parcialmente un autor
router.patch('/:id', patchAuthor);

// DELETE /api/authors/:id - Eliminar un autor
router.delete('/:id', deleteAuthor);

export default router;