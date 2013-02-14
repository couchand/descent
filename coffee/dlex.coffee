# descent lexer

tl = require './lexer.js'

basicLexer = new tl.TabbedLexer()

l = (pat, token) ->
  basicLexer.rules.push new tl.Rule pat, token

l /^( |\t)+/
l /^\{\?FINAL\?\}/, 'FINAL'
l /^\{\?METHOD\?\}/, 'METHOD'
l /^\{\?CLASS\?\}/, 'CLASS'
l /^global/i, 'GLOBAL'
l /^public/i, 'PUBLIC'
l /^readable/i, 'READABLE'
l /^private/i, 'PRIVATE'
l /^[a-zA-Z]+/, 'VAR'
l /^[0-9]+/, 'NUM'
l /^=/, '='
l /^->/, '->'
l /^:/, ':'
l /^\+/, '+'
l /^,/, ','
l /^\(/, '('
l /^\)/, ')'
l /^ /


module.exports = basicLexer
