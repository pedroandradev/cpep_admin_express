import { Clients } from "./clients.interface.js";
import { Service } from "./service.interface.js";
import { ExternalService } from "./externalService.interface.js";
import { LabMaintenance } from "./labMaintenance.interface.js";


export interface ClientContact{
    id: number;
    clientId: number;
    name: string;
    email: string;
    phone: string;
    position: string;
    isPrimary: boolean;

    client: Clients[];
    services: Service[];
    externals: ExternalService[];
    labMaint: LabMaintenance[];
}