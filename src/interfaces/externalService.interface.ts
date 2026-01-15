import { ClientContact } from "./clientContact.interface.js";
import { Clients } from "./clients.interface.js";
import { Employee } from "./employee.interface.js";

export interface ExternalService {
    id: number;
    clientId: number;
    employeeId: number;
    contactId: number;
    scheduleDate: Date;
    serviceDate: Date;
    status: string;
    description: string;
    osScan: string;

    createdAt: Date;
    updatedAt: Date;

    client: Clients[];
    employee: Employee[];
    contact: ClientContact[];
}

