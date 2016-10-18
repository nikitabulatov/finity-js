regex = new RegExp(/(D?D)|(YY?YY?)|(M?M)/g)

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

_getDateArgument = (match, index, arr, i18n) ->
  switch match
    when 'M'
      month = arr?[index] - 1
      if month >= 0 then [1, month] else [1, -1]
    when 'MM'
      month = arr?[index] - 1
      if month >= 0 then [1, month] else [1, -1]
    when 'D' then [2, +arr?[index] || -1]
    when 'DD' then [2, +arr?[index] || -1]
    when 'YYYY'
      year = arr?[index]
      year = if year.length > 2 then +year || -1 else -1
      [0, year]
    when 'YY'
      year = arr?[index] || -1
      year = if year >= 0 and year.toString().length is 4
        +year
      else
        yearStart = new Date().getFullYear().toString().substr(0, 2)
        year = if year >= 0 then yearStart + year else -1
        +year
      [0, year]

_parseDateWithFormat = (str, matches, i18n) ->
  arr = str.replace(/[^\wа-я]|_/gi, '-').split('-')
  dateArgs = [-1, -1, -1]
  for match, index in matches
    [argIndex, value] = _getDateArgument(match, index, arr, i18n)
    dateArgs[argIndex] = value if dateArgs[argIndex] < 0
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

parse = (rawStr, format, i18n) ->
  str = _prepareString(rawStr, i18n)
  format = _prepareFormat(format)
  if format and regex.test(format)
    matches = format.match(regex)
    dateArgs = _parseDateWithFormat(str, matches, i18n)
    return null for arg in dateArgs when isNaN(arg) || arg < 0
    return new Date(dateArgs[0], dateArgs[1], dateArgs[2])
  console.warn 'Unexpected format pattern' if format and not regex.test(format)
  new Date(str)

module.exports = parse
