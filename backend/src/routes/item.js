import { Router } from "express"

import {
  addItem,
  getItem,
  getItems,
  updateItem,
  deleteItem,
} from "../controllers/item.js"
import { asyncHandler } from "../utils/asyncHandler.js"

const itemRouter = Router()

itemRouter.get("/getAllItems", asyncHandler(getItems))
itemRouter.post("/item", asyncHandler(addItem))          // Implemented with Restful Web Services
itemRouter.get("/getOneItem/:id", asyncHandler(getItem))
itemRouter.put("/updateItem/:id", asyncHandler(updateItem))
itemRouter.delete("/item/:id", asyncHandler(deleteItem)) // Implemented with Restful Web Services


export default itemRouter
