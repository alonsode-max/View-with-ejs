const router = require("express").Router()
const { register, getAllClients, erase, changeClient, login, getAllTrainers, renderTemplate, renderClient } = require("../../controllers/client.controllers")
const { checkPlan } = require("../../middleware/client.middleware")
const upload = require("../../middleware/upload")

//router.post("/addClient", register) Para admins
router.get("/client", getAllClients)
router.get("/clientT/:id", getAllTrainers)
router.delete("/client/:id", erase)
router.put("/client/:id", changeClient)
router.post("/register", checkPlan, upload.single("imagen"), register)
router.post("/login", login)
//Renderizar vistas de ejs
router.get("/plantilla", renderTemplate)
router.get("/renderClient/:id", renderClient)

module.exports = router;