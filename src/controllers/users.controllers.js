import {db} from "../database/database.config.js"
export async function getUsers(req,res){
try{
    const resposta = await db.query(`SELECT * FROM users;`)
    res.send(resposta.rows)

}catch(err){
    res.status(500).send(err.message)
}
}
export async function signUp(req,res){
    try{
        console.log("tmj")
        res.sendStatus(201)

    } catch(err){
        res.status(500).send(err.message)
    }
}

export async function signIn(req,res){
    try{
        res.sendStatus(200)

    } catch(err){
        res.status(500).send(err.message)
    }
}