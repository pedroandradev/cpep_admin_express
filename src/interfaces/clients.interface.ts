import { ClientContact } from "./clientContact.interface.js";
import { Asset } from "./asset.interface.js";
import { Service } from "./service.interface.js";
import { ExternalService } from "./externalService.interface.js";
import { LabMaintenance } from "./labMaintenance.interface.js";
import { Software } from "./software.interface.js";

export interface Clients{
    id: number;
    name: string;
    shortName: string;
    email: string;
    phone: string;
    website: string;

    createdAt: Date;
    updatedAt: Date;

    contacts: ClientContact[];
    assets: Asset[];
    services: Service[]
    externals: ExternalService[];
    labMaint: LabMaintenance [];
    softwares: Software[];
}