import { Employee } from "./employee.interface.js";

export interface Vacation{
    id: number;
    employeeId: number;
    startDate: Date;
    endDate: Date;
    status: string;
    approvedBy: number;
    approvedAte: Date;

    employee: Employee[];
    approver: Employee[];
}