const bcrypt = require("bcrypt")
const { insertClient, getClients, eraseClient, updateClient, searchById, searchByEmail, getClientTrainer } = require("../models/client.models")
const { createToken } = require("../utilities/jwt")

const register = async (req, res) => {
    try {
        const client = req.body
        const searchEmail = await searchByEmail(client.email)
        if (searchEmail.length !== 0) {
            res.status(400).json("Ese email ya está en uso")
        }
        const imagen = req.file.path
        client.imagen = imagen
        client.password = bcrypt.hashSync(client.password, 10)
        const resultClient = await insertClient(client)
        res.status(202).json({ data: "El usuario ha sido añadido con éxito", insertId: resultClient.insertId })
    } catch (error) {
        res.status(500).json(error);
        console.log(error)
    }
}

const getAllClients = async (req, res) => {
    try {
        const resultClient = await getClients()
        res.json({ msg: "Todo ok", data: resultClient })
    } catch (error) {
        console.log(error)
    }
}

const erase = async (req, res) => {
    try {
        const { id } = req.params
        const clientSelect = await searchById(id)
        if (clientSelect.length === 0) {
            res.status(404).json("El usuario no existe")
        }
        else {
            const resultClient = await eraseClient(id)
            res.json({ msg: "Todo ok", data: "Se ha eliminado con éxito" })
        }
    } catch (error) {
        console.log(error)
    }
}

const changeClient = async (req, res) => {
    try {
        const { id } = req.params
        const client = req.body
        const clientSelect = await searchById(id)
        if (clientSelect.length === 0) {
            res.status(404).json("El usuario no existe")
        }
        else {
            const resultClient = await updateClient(id, client)
            if (resultClient.affectedRows !== 0) {
                res.status(200).json({ resp: "Respuesta del servidor", data: "Cliente modificado con exito" })
            }
        }
    } catch (error) {
        console.log(error)
    }
}

const login = async (req, res) => {
    try {
        const body = req.body
        const client = await searchByEmail(body.email)
        if (client.length === 0) {
            res.status(404).json("Ese email no existe, regístrate")
        }
        else {
            if (bcrypt.compareSync(body.password, client[0].password)) {
                const token = createToken({ id: client[0].idClient, email: client[0].email, role: client[0].role })
                res.status(202).json({ msg: "Sesión iniciada con éxito con éxito", token: token })
            }
            else {
                res.status(400).json("Contraseña incorrecta")
            }
        }
    } catch (error) {
        res.status(500).json(error);
        console.log(error)
    }
}

const getAllTrainers = async (req, res) => {
    try {
        const resultClient = await getClientTrainer(req.params.id)
        res.json({ msg: "Todo ok", data: resultClient })
    } catch (error) {
        console.log(error)
    }
}

const renderTemplate = async (req, res) => {
    res.render("home", { data: ["maria", "luis"] })
}

const renderClient = async (req, res) => {
    const data = await searchById(req.params.id)
    res.render("client", { data: data[0] })
}


module.exports = { getAllClients, register, erase, changeClient, login, getAllTrainers, renderTemplate, renderClient }

