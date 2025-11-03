const router = require("express").Router()

router.use("/", require("./api.routes/users.routes"))
router.use("/plan", require("./api.routes/plan.routes"))

module.exports = router;