/* eslint-disable */
const express = require('express')
const functions = require('firebase-functions')

const { encrypt, decrypt } = require('./crypto')
const { getOAuthRequestToken } = require('./twitter-auth')
const { mixerAuthUrl } = require('./mixer-auth')

const auth = express()
const authRouter = express.Router()

authRouter.get('/twitter', async (req, res) => {
    const state = encrypt({ id: 'testing' })
    const { oauthRequestToken } = await getOAuthRequestToken(state)
    const authorizationUrl = `https://api.twitter.com/oauth/authorize?oauth_token=${oauthRequestToken}`
    res.redirect(authorizationUrl)
})

authRouter.get('/mixer', async (req, res) => {
    res.redirect(mixerAuthUrl)
})

auth.use('/auth', authRouter)
exports.auth = functions.https.onRequest(auth)

const cb = express()
const cbRouter = express.Router()

cbRouter.get('/twitter', async (req, res) => {
    const { state } = req.query
    console.log(decrypt(state))
    res.redirect('/')
})

cb.use('/callback', cbRouter)
exports.callback = functions.https.onRequest(cb)
