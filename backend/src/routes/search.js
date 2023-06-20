import { Router } from "express"

import { searchEndpoint } from "../controllers/search.js"
import { asyncHandler } from "../utils/asyncHandler.js"

const searchRouter = Router()

searchRouter.get("/SearchForItem/:keyword", asyncHandler(searchEndpoint))

export default searchRouter
