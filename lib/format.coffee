patterns = require('patterns')

# TODO: Format time
regexps = [new RegExp(/(Do)|(Mo)/g), new RegExp(/(d?dd?d?)|(D?D)|(YY?YY?)|(M?MM?M?)/g)]

_match = (regex, date, str, i18n, genitive) ->
  matches = str.match(regex)
  return str unless matches
  for match in matches
    result = patterns[match]?.formatFunc(date, i18n, genitive) || match
    str = str.replace(match, result)
  str

format = (date, format, genitive, i18n) ->
  str = format
  for regex in regexps
    str = _match(regex, date, str, i18n, genitive)
  str

module.exports = format
