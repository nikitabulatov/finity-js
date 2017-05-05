patterns = require('patterns')
# TODO: move it to patterns.coffee
regex = new RegExp(/D{1,2}|M{1,2}|(YY?YY?)|h{1,2}|H{1,2}|m{1,2}|k{1,2}|s{1,2}/g)

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
  str.toLowerCase().replace(/nd|st|rd|th|am|pm/g, '')

_parseDateWithFormat = (str, format, regex, rawStr) ->
  format = _prepareFormat(format)
  matches = format.match(regex)
  arr = str.replace(/[^\wа-я]|_/gi, '-').split('-')
  dateArgs = []
  for match, index in matches
    [argIndex, value] = patterns[match].parseFunc({
      matches
      str: rawStr
      value: arr?[index]
    })
    dateArgs[argIndex] = value if dateArgs[argIndex] is undefined and argIndex >= 0
  return null if dateArgs.length < 3
  return _newInstance(dateArgs)

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
  return null for arg in dateArgs when isNaN(arg)
  new (Function.prototype.bind.apply(Date, [null].concat(dateArgs)))

parse = (rawStr, formats, i18n) ->
  str = _prepareString(rawStr, i18n)
  if formats
    formats = [formats] unless formats instanceof Array
    for format in formats
      date = _parseDateWithFormat(str, format, regex, rawStr)
      return date if date
  console.warn 'Unexpected format pattern' if formats and not regex.test(formats)
  new Date(str)

module.exports = parse
