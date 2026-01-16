import { z } from "zod";

export const employeeIdParamsSchema = z.object({
    params: z.object({
        id: z.string().min(1)
    }),
    query: z.object({}).optional(),
    body: z.object({}).optional(),
})

export const employeeCreateSchema = z.object({
    body: z.object({
        name: z.string().min(2),
        email: z.email(),
        phone: z.string().optional(),
        birthDate: z.coerce.date().optional(),
        city: z.string().optional(),
        hireDate: z.coerce.date(),
    }),
    params: z.object({}).optional(),
    query: z.object({}).optional(),
})

export const employeeUpdateSchema = z.object({
    params: z.object({
        id: z.string().min(1),
    }),
    body: z.object({
        name: z.string().min(2).optional(),
        email:z.email().optional(),
        phone: z.string().optional().nullable(),
        profilePhoto: z.string().optional().nullable(),
        birthDate: z.coerce.date().optional().nullable(),
        city: z.string().optional().nullable(),
        hireDate: z.coerce.date().optional()
    }),
    query: z.object({}).optional(),
})

export const employeeListSchema = z.object({
    query: z.object({
        page: z.coerce.number().int().min(1).default(1),
        limit: z.coerce.number().int().min(1).max(100).default(10),
        search: z.string().optional(),
        city: z.string().optional(),
        orderBy: z.enum(["createdAt", "name", "email"]).default("createdAt"),
        order: z.enum(["asc", "desc"]).default("desc")
    }),
    params: z.object({}).optional(),
    body: z.object({}).optional(),
})