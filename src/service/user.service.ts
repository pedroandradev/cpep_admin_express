import { pool } from '../config/database.js';
import { User } from '../interfaces/user.interface.js';

export async function findAllUsers(): Promise<User[]> {
  const [rows] = await pool.query('SELECT * FROM users');
  return rows as User[];
}
