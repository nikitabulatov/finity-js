patterns = require('patterns')
r = new RegExp(/Do|Mo|D{1,2}|d{3,4}|M{1,4}|(YY?YY?)|h{1,2}|H{1,2}|m{1,2}|k{1,2}|s{1,2}|a|A/g)

module.exports = (date, format, genitive, i18n) ->
  format.replace(r, (match) ->
    return patterns[match].formatFunc({date, i18n, genitive}) if match of patterns
    match.slice(1, match.length - 1)
  )
