const pool = require("../config/conex")

const searchById = async (id) => {
    const select = "SELECT * FROM clientes WHERE idCliente=?";
    const [result] = await pool.query(select, id)
    return result;
}

const searchByEmail = async (email) => {
    const select = "SELECT * FROM clientes WHERE email=?";
    const [result] = await pool.query(select, email)
    return result;
}

const insertClient = async (client) => {
    const { nombre, email, password, fk_idplan, imagen } = client
    const insert = "INSERT INTO clientes (nombre, email, password, fk_idplan, imagen) values(?,?,?,?,?)";
    const [result] = await pool.query(insert, [nombre, email, password, fk_idplan, imagen])
    return result
}

const getClients = async () => {
    const select = "SELECT * FROM clientes";
    const [result] = await pool.query(select)
    return result
}

const eraseClient = async (id) => {
    const erase = "DELETE FROM clientes WHERE idCliente=?";
    const [result] = await pool.query(erase, id)
    return result
}

const updateClient = async (id, client) => {
    const isId = await searchById(id)
    if (parseInt(isId.length) === 0) {
        const { nombre, email, password } = client
        const update = "UPDATE clientes SET nombre = ?, password=?, email=? WHERE idCliente= ?";
        const [result] = await pool.query(update, [nombre, password, email, id])
        return result
    }
    else {
        return "No se encontró el id"
    }
}

const getClientTrainer = async (id) => {
    const select = "select e.nombre as nombre_entrenador, c.nombre as nombre_cliente from entrenador as e inner join clientes_has_entrenador as ec on e.idempleados = ec.fk_idempleados inner join clientes as c on c.idCliente = ec.fk_idCliente where c.idCliente = ?";
    const [result] = await pool.query(select, id)
    return result
}

module.exports = { insertClient, getClients, eraseClient, updateClient, searchById, searchByEmail, getClientTrainer }