import { Asset } from "./asset.interface.js";
import { ClientContact } from "./clientContact.interface.js";
import { Clients } from "./clients.interface.js";
import { Employee } from "./employee.interface.js";

export interface LabMaintenance {
    id: number;
    assetId: number;
    clientId: number;
    contactId: number;
    employeeId: number;
    status: string;
    problemDesc: string;
    serviceDesc: string;
    receivedAt: Date;
    exitAt: Date;
    returnedAt: Date;

    createdAt: Date;
    updatedAt: Date;

    asset: Asset[];
    client: Clients[];
    contact: ClientContact[];
    employee: Employee[]
}