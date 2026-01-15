import { Clients } from "./clients.interface.js";
import { Infrastructure } from "./infrastructure.interface.js";
import { Server } from "./server.interface.js";
import { LabMaintenance } from "./labMaintenance.interface.js";

export interface Asset{
    id: number;
    clientId: number;
    assetType: string;

    name: string;
    status: string;
    description: string;

    createdAt: Date;
    updatedAt: Date;

    client: Clients[];
    infrastructure: Infrastructure[];
    server: Server[];
    labMaint: LabMaintenance[]
}