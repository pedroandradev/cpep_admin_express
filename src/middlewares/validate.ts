import { Request, Response, NextFunction } from "express"
import { ZodSchema } from "zod/v3"
import { HttpError } from "../utils/httpError.js"

export function validate(schema: ZodSchema){
    return(req: Request, _res: Response, next: NextFunction) => {
        const parsed = schema.safeParse({
            body: req.body,
            query: req.query,
            params: req.params,
        })
        if(!parsed.success){
            return next(new HttpError(400, "Validation error", parsed.error.flatten()))
        }

        req.body = parsed.data.body
        req.query = parsed.data.query
        req.params = parsed.data.params

        next()
    }
}