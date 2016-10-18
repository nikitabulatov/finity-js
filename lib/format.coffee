# TODO: Format time

regexps = [new RegExp(/(Do)|(Mo)/g), new RegExp(/(d?dd?d?)|(D?D)|(YY?YY?)|(M?MM?M?)/g)]

_appendPosfix = (str) ->
  end = 'th'
  end = 'st' if str[str.length - 1] is '1' and str[str.length - 2] isnt '1'
  end = 'nd' if str[str.length - 1] is '2' and str[str.length - 2] isnt '1'
  end = 'rd' if str[str.length - 1] is '3' and str[str.length - 2] isnt '1'
  "#{str}#{end}"

_formatPart = (date, match, genitive, i18n) ->
  day = date.getDate()
  day = "0#{day}" if day < 10
  month = date.getMonth() + 1
  month = "0#{month}" if month < 10
  year = '' + date.getFullYear()
  switch match
    when 'M' then (date.getMonth() + 1) + ''
    when 'MM' then month
    when 'Mo' then _appendPosfix((date.getMonth() + 1) + '')
    when 'MMM'
      m = i18n?.monthsShort?[date.getMonth()]
      console.warn('i18n monthsShort is not defined') unless m
      m || month
    when 'MMMM'
      if genitive
        m = i18n?.monthsGenitive?[date.getMonth()]
      else
        m = i18n?.months?[date.getMonth()]
      console.warn('i18n months is not defined') unless m
      m || month
    when 'D' then date.getDate() + ''
    when 'Do' then _appendPosfix('' + date.getDate())
    when 'DD' then day += ''
    when 'ddd'
      w = i18n?.weekdaysShort?[date.getDay()]
      console.warn('i18n weekdaysShort is not defined') unless w
      w || date.getDay()
    when 'dddd'
      w = i18n?.weekdays?[date.getDay()]
      console.warn('i18n weekdays is not defined') unless w
      w || date.getDay()
    when 'YYYY' then year
    when 'YY' then year.slice(-2)
    else match

_match = (regex, date, str, i18n, genitive) ->
  matches = str.match(regex)
  return str unless matches
  for match in matches
    result = _formatPart(date, match, i18n, genitive)
    str = str.replace(match, result)
  str

format = (date, format, i18n, genitive) ->
  str = format
  for regex in regexps
    str = _match(regex, date, str, i18n, genitive)
  str

module.exports = format
