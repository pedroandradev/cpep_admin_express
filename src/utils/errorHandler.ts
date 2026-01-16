import { Request, Response, NextFunction } from "express";
import { HttpError } from "./httpError.js";

export function errorHandler(
    err: unknown,
    _req: Request,
    res: Response,
    _next: NextFunction
){
    if (err instanceof HttpError){
        return res.status(err.statusCode).json({
            message: err.message,
            details: err.details ?? null,
        })
    }

    return res.status(500).json({
        message: "Internal server error"
    })
}