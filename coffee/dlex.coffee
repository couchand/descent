# descent lexer

tl = require './lexer.js'

basicLexer = new tl.TabbedLexer()
basicLexer.rules.push new tl.Rule /^( |\t)+/
basicLexer.rules.push new tl.Rule /^global/i, 'GLOBAL'
basicLexer.rules.push new tl.Rule /^public/i, 'PUBLIC'
basicLexer.rules.push new tl.Rule /^readable/i, 'READABLE'
basicLexer.rules.push new tl.Rule /^private/i, 'PRIVATE'
basicLexer.rules.push new tl.Rule /^[a-zA-Z]+/, 'VAR'
basicLexer.rules.push new tl.Rule /^[0-9]+/, 'NUM'
basicLexer.rules.push new tl.Rule /^=/, '='
basicLexer.rules.push new tl.Rule /^->/, '->'
basicLexer.rules.push new tl.Rule /^:/, ':'
basicLexer.rules.push new tl.Rule /^\+/, '+'
basicLexer.rules.push new tl.Rule /^,/, ','
basicLexer.rules.push new tl.Rule /^\(/, '('
basicLexer.rules.push new tl.Rule /^\)/, ')'
basicLexer.rules.push new tl.Rule /^`[^`]*`/, 'APEX'
basicLexer.rules.push new tl.Rule /^ /

module.exports = basicLexer;
