const { searchById } = require("../models/plan.models")

const checkPlan = async (req, res, next) => {
    console.log(req)
    const id = req.body.fk_idplan
    if (isNaN(id)) {
        res.status(400).json("El plan tiene que ser un número")
    }
    console.log(id)
    const select = await searchById(id)
    if (select.length === 0) {
        res.status(404).json("El plan no existe")
    }
    else {
        next()
    }
}

module.exports = { checkPlan }