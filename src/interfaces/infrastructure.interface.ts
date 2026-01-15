import { Asset } from "./asset.interface.js";
import { Software } from "./software.interface.js";

export interface Infrastructure{
    id: number;
    assetId: number;
    ipAddress: string;
    managementUrl: string;
    accessProtocol: string;
    accessPort: number;
    location: string;
    connectedDescription: string;
    notes: string;

    asset: Asset[];
    softwares: Software[];
} 