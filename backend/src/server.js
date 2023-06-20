import http from "http"
import app from "./app.js"
import { loadEnvironmentVariables } from "./utils/config.js"

loadEnvironmentVariables()

const port = process.env.PORT || 3004

const server = http.createServer(app)

server.listen(port, () => {
  console.log(
    `BazaarBox Management System Backend runs on http://localhost:${port}`
  )
})
