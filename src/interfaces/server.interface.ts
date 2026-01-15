import { Asset } from "./asset.interface.js";
import { Hd } from "./hd.interfaces.js";

export interface Server{
    id: number;
    assetId: number;

    cpuModel: string;
    cpuCores: number;
    cpuThreads: number;

    ramGb: number;
    ramType: string;
    ramSlotsTotal: number;
    ramsSlotsUsed: number;

    motherboard: string;
    bioVersion: string;
    architecture: string;

    storageController: string;
    raidLevel: string;
    totalStorageGb: number;

    networkInterfaces: number;
    primaryMac: string;
    secondaryMac: string;

    osName: string;
    osVersion: string;
    virtualization: string;
    isVirtual: boolean;

    serialNumber: string;
    numberFactory: string;
    model: string;
    purchaseDate: Date;
    warratyEnd: Date;

    asset: Asset[]
    hds: Hd[]
}