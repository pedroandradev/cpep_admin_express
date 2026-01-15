import { Request, Response } from 'express';
import { findAllUsers, postUser } from '../service/user.service.js';
import { prisma } from '../config/prisma.js';

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

export async function createUser(req: Request, res: Response) {
  const {name, email, password} = req.body;

  const userExists = await prisma.user.findUnique({
    where: {email}
  });

  if (userExists){
    return res.status(400).json({error: "Usuário já existe"});
  }
}
