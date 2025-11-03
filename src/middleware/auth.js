const { searchById } = require("../models/plan.models");
const { verifyToken } = require("../utilities/jwt");

const authClient = (req, res, next) => {
    try {
        const tokenHeader = req.headers.authorization;
        if (!tokenHeader) {
            res.json({ msg: "Haz Log In" })
        }
        const token = tokenHeader.split(" ")[1];
        const resultToken = verifyToken(token)
        if (!resultToken) {
            res.json({ msg: "Acceso denegado" })
        }
        else {
            req.informacionCliente = resultToken
            next()
        }
    } catch (error) {
        console.log(error)
    }
}
const checkAdmin = (req, res, next) => {
    if (req.informacionCliente.role === 'A') {
        next()
    }
    else {
        res.json({ msg: "Solo admins pueden acceder a este servicio" })
    }
}


//middleware plan id existe

module.exports = { authClient, checkAdmin }