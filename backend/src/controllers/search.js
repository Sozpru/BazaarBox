import { searchItem } from "./queryHandler/searchQueryHandler.js"
import { sendResponse } from "./queryHandler/sendResponse.js"

export async function searchEndpoint(req, res) {
  let result = []
  const { keyword } = req.params
  result = await searchItem(keyword)
  sendResponse(res, 200, result)
}
