import { db } from "../database/database.config.js"
export default async function validateAuth(req, res, next) {
    const { authorization } = req.headers
    const token = authorization?.replace("Bearer ", "")
    if (!token) return res.sendStatus(401)
    
    try {
        const user = await db.query(`SELECT * FROM tokens WHERE token = $1;`, [token])
        
        if (!user.rows[0]) return res.status(401).send("nao tem token na tabela")
        res.locals.user = user.rows[0]
        next()


    } catch (err) {
        res.status(500).send(err.message)
    }
}