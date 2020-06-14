const crypto = require('crypto')

const functions = require('firebase-functions')

const algorithm = 'aes-256-ctr'
const password = functions.config().crypt.key

function encrypt(obj) {
    const text = JSON.stringify(obj)
    const cipher = crypto.createCipher(algorithm, password)
    let crypted = cipher.update(text, 'utf8', 'hex')
    crypted += cipher.final('hex')
    return crypted
}

function decrypt(crypted) {
    const decipher = crypto.createDecipher(algorithm, password)
    let text = decipher.update(crypted, 'hex', 'utf8')
    text += decipher.final('utf8')
    const obj = JSON.parse(text)
    return obj
}

module.exports = {
    encrypt,
    decrypt,
}
