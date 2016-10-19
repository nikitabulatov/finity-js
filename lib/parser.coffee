patterns = require('patterns')
# TODO: move it to patterns.coffee
regex = new RegExp(/D{1,2}|M{1,2}|(YY?YY?)|h{1,2}|H{1,2}|m{1,2}|k{1,2}|s{1,2}|a|A/g)

_parseMonthString = (str, i18n) ->
  for items in i18n
    if items and items.length
      for value, index in items
        value = value.toLowerCase()
        return str.replace(value, index + 1) if ~str.indexOf(value)
  str

_replaceWeekdays = (str, i18n) ->
  for items in i18n
    for value, index in items
      value = value.toLowerCase()
      return str.replace(value, '') if ~str.indexOf(value)
  str

_replacePosfix = (str) ->
  str.replace(/nd|st|rd|th/g, '')

_parseDateWithFormat = (str, matches) ->
  arr = str.replace(/[^\wа-я]|_/gi, '-').split('-')
  dateArgs = []
  for match, index in matches
    [argIndex, value] = patterns[match].parseFunc(arr?[index], matches)
    dateArgs[argIndex] = value if dateArgs[argIndex] is undefined
  dateArgs

_prepareString = (str, i18n) ->
  str = str.toLowerCase()
  str = _parseMonthString(str, [i18n.monthsGenitive, i18n.months, i18n.monthsShort])
  str = _replaceWeekdays(str, [i18n.weekdays, i18n.weekdaysShort])
  str = _replacePosfix(str)

_prepareFormat = (format) ->
  return '' unless format
  format = for pattern in format.replace(/[^\wа-я]|_/gi, '-').split('-')
    switch pattern
      when 'Do' then 'D'
      when 'Mo' then 'M'
      when 'MMM' then 'M'
      when 'MMMM' then 'M'
      when 'ddd' then ''
      when 'dddd' then ''
      else pattern
  format.join('-')

_newInstance = (dateArgs) ->
  new (Function.prototype.bind.apply(Date, [null].concat(dateArgs)))

parse = (rawStr, format, i18n) ->
  str = _prepareString(rawStr, i18n)
  format = _prepareFormat(format)
  if format and regex.test(format)
    dateArgs = _parseDateWithFormat(str, format.match(regex))
    return null if dateArgs.length < 3
    return _newInstance(dateArgs)
  console.warn 'Unexpected format pattern' if format and not regex.test(format)
  new Date(str)

module.exports = parse
