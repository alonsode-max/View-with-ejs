const { insertPlan, editPlan } = require("../models/plan.models");

const insert = async (req, res) => {
    try {
        const plan = req.body
        const result = await insertPlan(plan)
        res.status(202).json({ data: "El plan ha sido añadido con éxito", insertId: result.insertId })
    } catch (error) {
        res.status(500).json(error);
        console.log(error)
    }
}


const edit = async (req, res) => {
    try {
        const { id } = req.params
        const plan = req.body
        const result = await editPlan(id, plan)
        if (result.affectedRows !== 0) {
            res.status(200).json({ msg: "Plan modificado con exito" })
        }
        res.status(404).json({ msg: "Nada modificado" })
    } catch (error) {
        console.log(error)
    }
}

module.exports = { insert, edit }
