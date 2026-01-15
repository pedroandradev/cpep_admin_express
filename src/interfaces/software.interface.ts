import { Clients } from "./clients.interface.js";
import { Infrastructure } from "./infrastructure.interface.js";


export interface Software {
    id: number;
    clientId: number;
    infastructureId: number;
    name: string;
    acessIp: string;
    port: number;
    url: string;
    version: string;
    environment: string;
    notes: string;

    client: Clients[];
    infrastructure: Infrastructure[];
}