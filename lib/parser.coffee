regexp = new RegExp(/(dd)|(mm)|(yy?yy?)|(MMM?M?)|(Do)/g)

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
  str.replace(/nd|st|rd|th/, '')

_parseDateWithFormat = (str, matches, i18n) ->
  arr = str.replace(/[^\wа-я]|_/gi, '-').split('-')
  dateArgs = [-1, -1, -1]
  for match, index in matches
    switch match
      when 'dd' then dateArgs[2] = +arr?[index] || -1
      when 'Do' then dateArgs[2] = +_replacePosfix(arr?[index] || '') || -1
      when 'mm'
        month = arr?[index] - 1
        dateArgs[1] = if month >= 0 then month else -1
      when 'MMMM'
        dateArgs[1] = _parseMonthString(arr?[index], [i18n.months, i18n.monthsGenitive]) - 1
      when 'MMM'
        dateArgs[1] = _parseMonthString(arr?[index], [i18n.monthsShort]) - 1
      when 'yyyy' then dateArgs[0] = +arr?[index] || -1
      when 'yy'
        console.warn 'Year format (yy) is ambiguous. Set full year format'
        year = arr?[index] || -1
        if year >= 0 and year.toString().length is 4
          dateArgs[0] = +year
        else
          yearStart = new Date().getFullYear().toString().substr(0, 2)
          year = if year >= 0 then yearStart + year else -1
          dateArgs[0] = +year
  dateArgs

parse = (rawStr, format, i18n) ->
  str = rawStr.toLowerCase()
  format = format.replace(/[^\wа-я]|_/gi, '-') if format
  if not regexp.test(format) and format
    console.warn 'Unexpected format'
    return null
  if format
    dateArgs = _parseDateWithFormat(str, format.match(regexp), i18n)
    for arg in dateArgs when isNaN(arg) || arg < 0
      console.warn "#{rawStr} with format (#{format}) parsed with errors. Check your arguments"
      return null
    return new Date(dateArgs[0], dateArgs[1], dateArgs[2])
  else
    str = _parseMonthString(str, [i18n.months, i18n.monthsShort, i18n.monthsGenitive])
    str = _replaceWeekdays(str, [i18n.weekdays, i18n.weekdaysShort])
    str = _replacePosfix(str)
    return new Date(str) unless format
    for arg in dateArgs when isNaN(arg) || arg < 0
      console.warn "#{rawStr} with format (#{format}) parsed with errors. Check your arguments"
      return null
  new Date(rawStr)

module.exports = parse
