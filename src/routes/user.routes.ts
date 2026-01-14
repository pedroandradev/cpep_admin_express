import { Router } from 'express';
import { listUsers, logUsers } from '../controllers/user.controller.js';

const router = Router();

router.get('/users', listUsers);
router.post('/users', logUsers);

export default router;
