import {db} from "../database/database.config.js"
import bcrypt from "bcrypt"
import {v4 as uuid} from "uuid"
export async function getUsers(req,res){
try{
    const resposta = await db.query(`SELECT * FROM users;`)
    res.send(resposta.rows)

}catch(err){
    res.status(500).send(err.message)
}
}
export async function signUp(req,res){
    const {name, email, password} = req.body
    try{
        const checkEmail = await db.query(`SELECT * FROM users WHERE email=$1;`, [email] )
        if(checkEmail.rows[0]) return res.sendStatus(409)

        const hash = bcrypt.hashSync(password, 10)

        await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [name, email, hash])
        res.sendStatus(201)

    } catch(err){
        res.status(500).send(err.message)
    }
}

export async function signIn(req,res){
    const {email, password} = req.body
    try{
        const checkUser = await db.query(`SELECT * FROM users WHERE email= $1;`, [email])
        if(!checkUser.rows[0]) return res.sendStatus(401)

        const isPasswordCorret = bcrypt.compareSync(password, checkUser.rows[0].password)
        if(!isPasswordCorret) return res.sendStatus(401)

        const token = uuid()
        await db.query(`INSERT INTO tokens ("userId", token) VALUES ($1, $2);`, [checkUser.rows[0].id, token])

        const tokenObject = { token: token}

        res.send(tokenObject).status(200)

    } catch(err){
        res.status(500).send(err.message)
    }
}