const pool = require("../config/conex")

const insertPlan = async (plan) => {
    const { nombre, precio, descripcion } = plan
    const insert = "INSERT INTO plan (nombre, precio, descripcion) values(?,?,?)";
    const [result] = await pool.query(insert, [nombre, precio, descripcion])
    return result
}

const editPlan = async (id, plan) => {
    const { nombre, precio, descripcion } = plan
    const update = "UPDATE plan SET nombre = ?, precio=?, descripcion=? WHERE idPlan= ?";
    const [result] = await pool.query(update, [nombre, precio, descripcion, id])
    return result
}

const searchById = async (id) => {
    const select = "SELECT * FROM plan WHERE idPlan=?";
    const [result] = await pool.query(select, id)
    return result;
}

module.exports = { insertPlan, editPlan, searchById }