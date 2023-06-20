import dotenv from "dotenv"

export function loadEnvironmentVariables() {
  dotenv.config({ path: ".env" })
}
