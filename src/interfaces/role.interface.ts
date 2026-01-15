import { Employee } from "./employee.interface.js";
import { Service } from "./service.interface.js";

export interface Role{
    id: number;
    name: string;
    employess: Employee[];
    services: Service[];
}