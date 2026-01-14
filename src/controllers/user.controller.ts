import { Request, Response } from 'express';
import { findAllUsers, postUser } from '../service/user.service.js';

export async function listUsers(req: Request, res: Response): Promise<Response> {
  try {
    const users = await findAllUsers();
    return res.json(users);
  } catch (error) {
    return res.status(500).json({ message: 'Erro ao buscar usuários' });
  }
}

export async function logUsers (req: Request, res: Response): Promise<Response> {
  try {
    const users = await postUser();
    return res.json(users)
  } catch (error){
    return res.status(500)
  }
}
