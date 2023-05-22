import { db } from "../database/database.config.js"
import { nanoid } from "nanoid"


export async function createShortUrl(req, res) {
    const { url } = req.body
    const { userId } = res.locals.user
    try {
        const shortUrl = nanoid(8, url)

        await db.query(`INSERT INTO urls (url, "shortUrl", "userId" ) VALUES ($1, $2, $3);`, [url, shortUrl, userId])

        const result = { "id": userId, "shortUrl": shortUrl }
        res.status(201).send(result)
    } catch (err) {
        res.status(500).send(err.message)
    }
}
export async function getUrls(req, res) {
    const { id } = req.params
    try {
        const urlById = await db.query(`SELECT * FROM urls WHERE id = $1;`, [id])
        if (!urlById.rows[0]) return res.sendStatus(404)
        const result = { "id": urlById.rows[0].id, "shortUrl": urlById.rows[0].shortUrl, "url": urlById.rows[0].url }
        res.status(200).send(result)

    } catch (err) {
        res.status(500).send(err.message)
    }
}
export async function openLinkUrl(req, res) {
    const { shortUrl } = req.params
    console.log(shortUrl)
    try {
        const result = await db.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl])
        if (!result.rows[0]) return res.sendStatus(404)
        const updateVisitCount = result.rows[0].visitCount + 1

        await db.query(`UPDATE urls SET "visitCount" = $1 WHERE id = $2`, [updateVisitCount, result.rows[0].id])

        res.redirect(result.rows[0].url)


    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function deleteUrl(req, res) {
    const { id } = req.params
    const { userId } = res.locals.user
    try {
        const urlById = await db.query(`SELECT * FROM urls WHERE id = $1;`, [id])
        if (!urlById.rows[0]) return res.sendStatus(404)
        const result = await db.query(`SELECT * FROM urls WHERE id = $1 AND "userId" = $2`, [id, userId])
        if (!result.rows[0]) return res.sendStatus(401)
        await db.query(`DELETE FROM urls WHERE id = $1;`, [id])
        res.sendStatus(204)

    } catch (err) {
        res.status(500).send(err.message)
    }
}
export async function getUserMe(req, res) {
    const {userId} = res.locals.user
    try {
        
        const result = await db.query(`
        SELECT
        users.id,
        users.name,
        COALESCE(SUM(urls."visitCount"), 0) AS "visitCount",
        ARRAY_AGG(
          JSON_BUILD_OBJECT(
            'id', urls.id,
            'shortUrl', urls."shortUrl",
            'url', urls.url,
            'visitCount', COALESCE(urls."visitCount", 0)
          )
        ) AS "shortenedUrls"
      FROM
        users
      LEFT JOIN
        urls ON users.id = urls."userId"
      WHERE
        users.id = $1
      GROUP BY
        users.id;`, [userId])
        //console.log(result.rows[0].visitCount)
        //if(result.rows[0].visitCount === null){
       //     result.rows[0].visitCount = 0
       // }
       // console.log(result.rows[0].shortenedUrls.map(short => {
        //    if(short.visitCount === null){
       //         short.visitCount === 0
        //    }}))
        //if(result.rows[0].shortenedUrls.visitCount === null){
            //result.rows[0].shortenedUrls.visitCount === 0

        //}
        res.status(200).send(result.rows[0])
    } catch (err) {
        res.status(500).send(err.message)
    }
}
export async function findRanking(req, res){
    try{
        const result = await db.query(`SELECT
        users.id,
        users.name,
        COUNT(urls.id) AS "linksCount",
        COALESCE(SUM(urls."visitCount"), 0) AS "visitCount"
      FROM
        users
      LEFT JOIN
        urls ON users.id = urls."userId"
      GROUP BY
        users.id
      ORDER BY
        "visitCount" DESC
      LIMIT 10;`)
      res.send(result.rows)

    }catch(err){
        res.status(500).send(err.message)
    }
}