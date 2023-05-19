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