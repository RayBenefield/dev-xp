/* eslint-disable */
const oauth = require('oauth')
const functions = require('firebase-functions')

const TWITTER_CONSUMER_API_KEY = functions.config().twitter.key
const TWITTER_CONSUMER_API_SECRET_KEY = functions.config().twitter.secret

const oauthConsumer = new oauth.OAuth(
    'https://twitter.com/oauth/request_token',
    'https://twitter.com/oauth/access_token',
    TWITTER_CONSUMER_API_KEY,
    TWITTER_CONSUMER_API_SECRET_KEY,
    '1.0A',
    null,
    'HMAC-SHA1'
)

async function getOAuthRequestToken(state) {
    return new Promise((resolve, reject) => {
        oauthConsumer.getOAuthRequestToken(
            {
                oauth_callback: `https://rampant.ai/callback/twitter?state=${state}`,
            },
            function(
                error,
                oauthRequestToken,
                oauthRequestTokenSecret,
                results
            ) {
                return error
                    ? reject(new Error('Error getting OAuth request token'))
                    : resolve({
                          oauthRequestToken,
                          oauthRequestTokenSecret,
                          results,
                      })
            }
        )
    })
}

module.exports = {
    getOAuthRequestToken,
}
