import { Hd } from "./hd.interfaces.js";

export interface Backup {
    id: number;
    hdId: number;
    status: string;
    executedAt: Date;
    lastRunAt: Date;
    nextTunAt: Date;

    hd: Hd[]
}