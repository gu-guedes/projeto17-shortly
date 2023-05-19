import { db } from "../database/database.config.js"
import { nanoid } from "nanoid"


export async function createShortUrl(req, res) {
    const { url } = req.body
    const { userId } = res.locals.user
    try {
        const shortUrl = nanoid(8, url)

        await db.query(`INSERT INTO urls (url, "shortUrl", "userId" ) VALUES ($1, $2, $3);`, [url, shortUrl, userId])

        const result = {"id": userId, "shortUrl": shortUrl}
        res.status(201).send(result)
    } catch (err) {
        res.status(500).send(err.message)
    }
}
export async function getUrls(req, res){
    const {id} = req.params
    try{
        const urlById = await db.query(`SELECT * FROM urls WHERE id = $1;`, [id])
        if(!urlById.rows[0]) return res.sendStatus(404)
        const result = {"id": urlById.rows[0].id, "shortUrl": urlById.rows[0].shortUrl, "url": urlById.rows[0].url}
        res.status(200).send(result)

    }catch(err){
        res.status(500).send(err.message)
    }
}
export async function openLinkUrl(req, res){
    const {shortUrl} = req.params
    console.log(shortUrl)
    try{
        const result = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl])
        if(!result.rows[0]) return res.sendStatus(404)
        const updateVisitCount = result.rows[0].visitCount + 1
        
        await db.query(`UPDATE urls SET "visitCount" = $1 WHERE id = $2`,[updateVisitCount, result.rows[0].id])

        res.redirect(result.rows[0].url)


    }catch(err){
        res.status(500).send(err.message)
    }
}