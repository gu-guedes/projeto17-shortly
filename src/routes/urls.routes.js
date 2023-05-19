import {Router } from "express"
import validateSchema from "../middlewares/validateSchemas.middlewares.js"
import { urlSchema } from "../schemas/urls.schemas.js"
import { createShortUrl, getUrls, openLinkUrl } from "../controllers/urls.controllers.js"
import validateAuth from "../middlewares/validateAuth.middlewares.js"

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", validateSchema(urlSchema), validateAuth, createShortUrl)
urlsRouter.get("/urls/:id", getUrls)
urlsRouter.get("/urls/open/:shortUrl", openLinkUrl)

export default urlsRouter