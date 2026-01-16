import { prisma } from "../../config/prisma.js";
import { HttpError } from "../../utils/httpError.js";

type ListArgs = {
    page: number
    limit: number
    search?: string
    city?: string
    orderBy: "createdAt" | "name" | "email"
    order: "asc" | "desc"
}

function toBigInt(id: string): bigint {
 if (!/^\d+$/.test(id)) throw new HttpError(400, "Invalid id");
  return BigInt(id);
}

export const employeeService = {
    async create(data: {
        name: string
        email: string
        phone?: string
        profilePhoto?: string
        birthDate?: Date;
        city?: string;
        hireDate: Date

    }){
        try{
            return await prisma.employee.create({
                data, select:{
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

                },
            })
        } catch (err: any){
            if(err?.code === "P2002"){
                throw new HttpError(409, "Email alredy in use")
            }
            throw err
        }
    },
        async getById(id: string) {
            const employee = await prisma.employee.findUnique({
                where: { id: toBigInt(id) },
                    select: {
                        id: true,
                        name: true,
                        email: true,
                        phone: true,
                        profilePhoto: true,
                        birthDate: true,
                        city: true,
                        hireDate: true,
                        createdAt: true,
                        updatedAt: true,
                    },
                });
        if (!employee) throw new HttpError(404, "Employee not found");
        return employee;
  },

        async list(args: ListArgs) {
            const { page, limit, search, city, orderBy, order } = args;
            const skip = (page - 1) * limit;

            const where = {
                ...(city ? { city } : {}),
                ...(search
                ? {
                    OR: [{ name: { contains: search } },{ email: { contains: search } },],
                } : {}),
            };

            const [items, total] = await prisma.$transaction([prisma.employee.findMany({
                where, skip, take: limit, orderBy: { [orderBy]: order },
                select: {
                    id: true,
                    name: true,
                    email: true,
                    phone: true,
                    city: true,
                    hireDate: true,
                    createdAt: true,
                    updatedAt: true,
                    },
                }),
                prisma.employee.count({ where }),
                ]);

                return { page, limit, total, totalPages: Math.ceil(total / limit), items, };
            },

  async update(id: string, data: Partial<{
    name: string;
    email: string;
    phone: string | null;
    profilePhoto: string | null;
    birthDate: Date | null;
    city: string | null;
    hireDate: Date;
  }>) {
    try {
      // garante existência antes (melhor DX que deixar estourar)
      await this.getById(id);

      return await prisma.employee.update({
        where: { id: toBigInt(id) },
        data,
        select: {
          id: true,
          name: true,
          email: true,
          phone: true,
          profilePhoto: true,
          birthDate: true,
          city: true,
          hireDate: true,
          createdAt: true,
          updatedAt: true,
        },
      });
    } catch (err: any) {
      if (err?.code === "P2002") {
        throw new HttpError(409, "Email already in use");
      }
      throw err;
    }
  },

  async remove(id: string) {
    // se tiver FK impedindo, Prisma vai lançar erro; você trata como 409 ou 400
    await this.getById(id);
    await prisma.employee.delete({ where: { id: toBigInt(id) } });
    return { deleted: true };
  },
};


