import cors from "cors"
import morgan from "morgan"
import express from "express"
import cookieParser from "cookie-parser"
import searchRouter from "./routes/search.js"
import itemRouter from "./routes/item.js"

const app = express()
let logger = null
if (app.get("env") === "development") {
  logger = morgan("dev")
} else {
  logger = morgan("combined")
}

app.use(logger)
app.use(
  cors({
    origin: "*",
    credentials: true,
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
    optionsSuccessStatus: 200,
  })
)
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static("./public"))

app.use(searchRouter)
app.use(itemRouter)

app.use((req, res) => {
  res.status(404).send("404, Page Not Found")
})

process.on("unhandledRejection", (err) => {
  console.log(`Error: ${err.message}`)
})

export default app
