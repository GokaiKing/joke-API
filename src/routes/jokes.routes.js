// src/routes/jokes.routes.js
import express from 'express';
import {
  getAllJokes,
  getJokeById,
  createJoke,
  updateJoke,
  patchJoke,
  deleteJoke
} from '../controllers/jokes.controller.js';

const router = express.Router();

// GET /api/jokes - Obtener todas las bromas
router.get('/', getAllJokes);

// GET /api/jokes/:id - Obtener una broma por ID
router.get('/:id', getJokeById);

// POST /api/jokes - Crear una nueva broma
router.post('/', createJoke);

// PUT /api/jokes/:id - Actualizar completamente una broma
router.put('/:id', updateJoke);

// PATCH /api/jokes/:id - Actualizar parcialmente una broma
router.patch('/:id', patchJoke);

// DELETE /api/jokes/:id - Eliminar una broma
router.delete('/:id', deleteJoke);

export default router;