import { ClientContact } from "./clientContact.interface.js";
import { Clients } from "./clients.interface.js";
import { Employee } from "./employee.interface.js";
import { Role } from "./role.interface.js";

export interface Service {
    id: number;
    clientId: number;
    employeeId: number;
    roleId: number;
    contactId: number;
    serviceDate: Date;
    status: string;
    reason: string;
    description: string;

    createdAt: Date;
    updatedAt: Date;

    client: Clients[]
    employee: Employee[]
    role: Role[]
    contact: ClientContact[]
}