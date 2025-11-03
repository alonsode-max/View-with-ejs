const { insert, edit } = require("../../controllers/plan.controllers")
const { authClient, checkAdmin } = require("../../middleware/auth")
const { checkIdPlan } = require("../../middleware/plan.middleware")

const router = require("express").Router()

router.post("/plan", authClient, checkAdmin, insert)
router.put("/plan/:id", authClient, checkAdmin, checkIdPlan, edit)

module.exports = router