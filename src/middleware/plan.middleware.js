const { searchById } = require("../models/plan.models")

const checkIdPlan = async (req, res, next) => {
    const { id } = req.params
    const select = await searchById(id)
    if (select.length === 0) {
        res.status(404).json("El plan no existe")
    }
    else {
        next()
    }
}

module.exports = { checkIdPlan }