import { prisma } from "../../config/prisma.js";
import { HttpError } from "../../utils/httpError.js";
import { EmployeeCreateBody, EmployeeUpdateBody } from "./employee.schemas.js";

type ListArgs = {
    page: number
    limit: number
    search?: string
    city?: string
    orderBy: "createdAt" | "name" | "email"
    order: "asc" | "desc"
}

const employeeSelect = {
    id: true,
    name: true,
    email: true,
    phone: true,
    profilePhoto:true,
    birthDate: true,
    city: true,
    hireDate: true,
    createdAt: true,
    updatedAt: true,
}

function toBigInt(id: string): bigint {
 if (!/^\d+$/.test(id)) throw new HttpError(400, "Invalid id");
  return BigInt(id);
}

export const employeeService = {
    async create(data: EmployeeCreateBody){
        try{
            return await prisma.employee.create({ data, select: employeeSelect,})
        } catch (err: any){
            if(err?.code === "P2002"){
                throw new HttpError(409, "Email alredy in use")
            }
            throw err
        }
    },
    async getById(id: string) {
        const employee = await prisma.employee.findUnique({ where: { id: toBigInt(id) }, select: employeeSelect,});
        if (!employee) throw new HttpError(404, "Employee not found");
        return employee;
    },

    async list(args: ListArgs) {
        const { page, limit, search, city, orderBy, order } = args;
        const skip = (page - 1) * limit;
        const where = { ...(city ? { city } : {}), ...(search ? { 
            OR: [{ name: { contains: search } },{ email: { contains: search } },], } : {}),};
        
        const [items, total] = await prisma.$transaction([prisma.employee.findMany({
            where, skip, take: limit, orderBy: { [orderBy]: order }, select: employeeSelect,}),
            prisma.employee.count({ where }),
            ]);
            return { page, limit, total, totalPages: Math.ceil(total / limit), items, };
        },

    async update(id: string, data: Partial<EmployeeUpdateBody>) {
        try {
            await this.getById(id);
            return await prisma.employee.update({ where: { id: toBigInt(id) }, data, select: employeeSelect, });
            } catch (err: any) {
                if (err?.code === "P2002") {
                throw new HttpError(409, "Email already in use");
            }
            throw err;
            }
        },

    async remove(id: string) {
        await this.getById(id);
        await prisma.employee.delete({ where: { id: toBigInt(id) } });
        return { deleted: true };
    },
};


