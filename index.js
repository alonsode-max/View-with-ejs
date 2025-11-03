const express = require("express")
const cors = require("cors")
const dotenv = require("dotenv")
dotenv.config()
const router = require("./src/routes/api.routes")
const cloudinary = require("cloudinary").v2

cloudinary.config({
    api_key: process.env.API_KEY_CLOUD,
    api_secret: process.env.API_SECRET_CLOUD,
    cloud_name: process.env.NAME_CLOUD
})

const server = express()
server.use(cors())
server.use(express.json())
server.set("view engine", "ejs")
server.use("/api", router)

server.listen(process.env.PORT, () => {
    console.log(`http://localhost:${process.env.PORT}`)
})

server.use(express.static("./web/dist"))