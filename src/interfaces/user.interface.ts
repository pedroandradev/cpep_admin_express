import { Employee } from "./employee.interface.js";

export interface User {
  id: number;
  employeeId: number;

  email: string;
  passwordHash: string;

  isActive: boolean;
  lastLoginAt: Date;

  createdAt: Date;
  updatedAt: Date;

  employee: Employee[];
}
