import { Router } from "express"
import { getUsers, signIn, signUp } from "../controllers/users.controllers.js"
import validateSchema from "../middlewares/validateSchemas.middlewares.js"
import { signinSchema, signupSchema } from "../schemas/users.schemas.js"

const usersRouter = Router()

usersRouter.get("/users", getUsers)
usersRouter.post("/signup", validateSchema(signupSchema), signUp)
usersRouter.post("/signin", validateSchema(signinSchema), signIn)

export default usersRouter