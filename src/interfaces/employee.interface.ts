import { User } from "./user.interface.js";
import { Role } from "./role.interface.js";
import { Vacation } from "./vacation.interface.js";
import { Service } from "./service.interface.js";
import { ExternalService } from "./externalService.interface.js";
import { LabMaintenance } from "./labMaintenance.interface.js";

export interface Employee{
    id: number;
    name: string;
    email: string;
    phone: string;
    profilePhoto: string;

    birthDate: Date;
    city: string;
    hireDate: Date;

    createdAt: Date;
    updatedAt: Date;

    users: User[];
    roles: Role[];
    vacation: Vacation[];
    approvedVac: Vacation[];
    services: Service[];
    externals: ExternalService[];
    labMaint: LabMaintenance[];
}