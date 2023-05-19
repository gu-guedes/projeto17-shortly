import {Router } from "express"
import validateSchema from "../middlewares/validateSchemas.middlewares.js"
import { urlSchema } from "../schemas/urls.schemas.js"
import { createShortUrl } from "../controllers/urls.controllers.js"
import validateAuth from "../middlewares/validateAuth.middlewares.js"

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", validateSchema(urlSchema), validateAuth, createShortUrl)

export default urlsRouter