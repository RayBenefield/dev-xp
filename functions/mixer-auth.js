const functions = require('firebase-functions')
const simpleOauthModule = require('simple-oauth2')

const clientId = functions.config().mixer.client_id
const oauth2 = simpleOauthModule.create({
    client: {
        id: clientId, // Your client ID here
    },
    auth: {
        tokenHost: 'https://mixer.com',
        tokenPath: '/api/v1/oauth/token',
        authorizePath: '/oauth/authorize',
    },
    options: {
        useBasicAuthorizationHeader: false,
    },
})

const scopes = [
    'chat:connect',
    'chat:chat',
    'chat:bypass_slowchat',
    'chat:whisper',
    'chat:bypass_catbot',
]
const url = 'https://rampant.ai/callback/mixer'
module.exports = {
    mixerAuthUrl: oauth2.authorizationCode.authorizeURL({
        redirect_uri: url,
        scope: scopes.join(' '), // your scopes here, leave blank, if you just need to ID the user
    }),
}
