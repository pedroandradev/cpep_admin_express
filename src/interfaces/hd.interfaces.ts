import {Server} from "./server.interface.js"
import { Backup } from "./backup.interface.js";

export interface Hd {
    id: number;
    serverId: number;
    type: string;
    capacityGb: number;
    interface: string;
    serialNumber: string;
    slot: string;
    status: string;

    server: Server[];
    backups: Backup[];
}