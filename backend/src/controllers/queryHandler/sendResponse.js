export function sendResponse(res, status, data) {
  res.status(status).send(data).end()
}
