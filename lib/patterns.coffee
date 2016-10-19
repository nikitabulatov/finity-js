_addZero = (str) ->
  str = "0#{str}" if str < 10
  str + ''

_appendPosfix = (str) ->
  end = 'th'
  end = 'st' if str[str.length - 1] is '1' and str[str.length - 2] isnt '1'
  end = 'nd' if str[str.length - 1] is '2' and str[str.length - 2] isnt '1'
  end = 'rd' if str[str.length - 1] is '3' and str[str.length - 2] isnt '1'
  "#{str}#{end}"

module.exports =
  M:
    formatFunc: ({date}) ->
      (date.getMonth() + 1) + ''
    parseFunc: (value) ->
      month = value - 1
      if month >= 0 then [1, month] else [1, -1]
  MM:
    formatFunc: ({date}) ->
      _addZero(date.getMonth() + 1)
    parseFunc: (value) ->
      month = value - 1
      if month >= 0 then [1, month] else [1, -1]
  Mo:
    formatFunc: ({date}) ->
      _appendPosfix((date.getMonth() + 1) + '')
  MMM:
    formatFunc: ({date, i18n, genitive}) ->
      m = i18n?.monthsShort?[date.getMonth()]
      console.warn('i18n monthsShort is not defined') unless m
      m || _addZero(date.getMonth() + 1)
  MMMM:
    formatFunc: ({date, i18n, genitive}) ->
      if genitive
        m = i18n?.monthsGenitive?[date.getMonth()]
      else
        m = i18n?.months?[date.getMonth()]
      console.warn('i18n months is not defined') unless m
      m || _addZero(date.getMonth() + 1)
  D:
    formatFunc: ({date}) ->
      date.getDate() + ''
    parseFunc: (value) ->
      [2, +value]
  Do:
    formatFunc: ({date}) ->
      _appendPosfix('' + date.getDate())
  DD:
    formatFunc: ({date}) ->
      _addZero(date.getDate())
    parseFunc: (value) ->
      [2, +value]
  ddd:
    formatFunc: ({date, i18n}) ->
      w = i18n?.weekdaysShort?[date.getDay()]
      console.warn('i18n weekdaysShort is not defined') unless w
      w || date.getDay()
  dddd:
    formatFunc: ({date, i18n}) ->
      w = i18n?.weekdays?[date.getDay()]
      console.warn('i18n weekdays is not defined') unless w
      w || date.getDay()
  YY:
    formatFunc: ({date}) ->
      year = '' + date.getFullYear()
      year.slice(-2)
    parseFunc: (value) ->
      year = value || -1
      year = if year >= 0 and year.toString().length is 4
        +year
      else
        yearStart = new Date().getFullYear().toString().substr(0, 2)
        year = if year >= 0 then yearStart + year else -1
        +year
      [0, year]
  YYYY:
    formatFunc: ({date}) ->
      '' + date.getFullYear()
    parseFunc: (value) ->
      year = if value.length > 2 then +value || -1 else -1
      [0, year]
  H:
    formatFunc: ({date}) ->
      '' + date.getHours()
    parseFunc: (value) ->
      # TODO: check 0 and 24
      # [3, +value]
  HH:
    formatFunc: ({date}) ->
      _addZero('' + date.getHours())
    parseFunc: (value) ->
      # TODO: check 0 and 24
      [3, +value]
  h:
    formatFunc: ({date}) ->
      hours = date.getHours() || 24
      hours = hours - 12 if hours > 12
      '' + hours
    parseFunc: (value, matches) ->
      # TODO: check 0 and 24
      # TODO: look at 'A' or 'a' param
      # [3, +value]
  hh:
    formatFunc: ({date}) ->
      hours = date.getHours() || 24
      hours = hours - 12 if hours > 12
      _addZero('' + hours)
    parseFunc: (value) ->
      # TODO: check 0 and 24
      # TODO: look at 'A' or 'a' param
      # [3, +value]
  k:
    formatFunc: ({date}) ->
      '' + (date.getHours() || 24)
  kk:
    formatFunc: ({date}) ->
      _addZero('' + (date.getHours() || 24))
  m:
    formatFunc: ({date}) ->
      '' + date.getMinutes()
  mm:
    formatFunc: ({date}) ->
      _addZero('' + date.getMinutes())
  s:
    formatFunc: ({date}) ->
      '' + date.getSeconds()
  ss:
    formatFunc: ({date}) ->
      _addZero('' + date.getSeconds())
  a:
    formatFunc: ({date}) ->
      hours = date.getHours()
      return 'pm' if hours >= 12
      return 'am'
  A:
    formatFunc: ({date, matches}) ->
      hours = date.getHours()
      return 'PM' if hours >= 12
      return 'AM'
