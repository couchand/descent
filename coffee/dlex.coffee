# descent lexer

tl = require './lexer.js'

basicLexer = new tl.TabbedLexer()
basicLexer.rules.push new tl.Rule /^( |\t)+/
basicLexer.rules.push new tl.Rule /^[a-zA-Z]+/, 'VAR'
basicLexer.rules.push new tl.Rule /^[0-9]+/, 'NUM'
basicLexer.rules.push new tl.Rule /^=/, '='
basicLexer.rules.push new tl.Rule /^->/, '->'
basicLexer.rules.push new tl.Rule /^:/, ':'
basicLexer.rules.push new tl.Rule /^\+/, '+'
basicLexer.rules.push new tl.Rule /^,/, ','
basicLexer.rules.push new tl.Rule /^\(/, '('
basicLexer.rules.push new tl.Rule /^\)/, ')'
basicLexer.rules.push new tl.Rule /^ /

module.exports = basicLexer;
