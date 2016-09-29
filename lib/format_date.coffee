formatRegex = new RegExp(/(dd)|(DDD?D?)|(mm)|(yyyy)|(yy)|(MMMM)|(MMM)|(Do)/g)

_formatMatch = (date, match, i18n, genitive) ->
  day = date.getDate()
  day = "0#{day}" if date < 10
  month = date.getMonth() + 1
  month = "0#{month}" if month < 10
  year = '' + date.getFullYear()
  switch match
    when 'dd' then day += ''
    when 'DDD'
      w = i18n?.weekdaysShort?[date.getDay()]
      console.warn('i18n weekdaysShort is not defined') unless w
      w || date.getDay()
    when 'DDDD'
      w = i18n?.weekdays?[date.getDay()]
      console.warn('i18n weekdays is not defined') unless w
      w || date.getDay()
    when 'mm' then month += ''
    when 'MMMM'
      if genitive
        m = i18n?.monthsGenitive?[date.getMonth()]
      else
        m = i18n?.months?[date.getMonth()]
      console.warn('i18n months is not defined') unless m
      m || month
    when 'MMM'
      m = i18n?.monthsShort?[date.getMonth()]
      console.warn('i18n monthsShort is not defined') unless m
      m || month
    when 'Do'
      d = '' + date.getDate()
      end = 'th'
      end = 'st' if d[d.length - 1] is '1' and d[d.length - 2] isnt '1'
      end = 'nd' if d[d.length - 1] is '2' and d[d.length - 2] isnt '1'
      end = 'rd' if d[d.length - 1] is '3' and d[d.length - 2] isnt '1'
      "#{d}#{end}"
    when 'yyyy' then year
    when 'yy' then year.slice(-2)
    else match

module.exports = (date, format, i18n, genitive) ->
  matches = format.match(formatRegex)
  throw new Error("Wrong dateFormat: #{format}.") unless matches.length
  str = format
  for match in matches
    result = _formatMatch(date, match, i18n, genitive)
    str = str.replace(match, result)
  str
