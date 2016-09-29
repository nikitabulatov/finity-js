# Format instanceof Date to ISO string
#
# @param {Date}.
#
# @return {String} "2016-10-08"
dateToISO = (date) ->
  return unless date instanceof Date
  [year, month, day] = [date.getFullYear(), date.getMonth(), date.getDate()]
  month = month + 1
  month = if month < 10 then "0#{month}" else month
  day = if day < 10 then "0#{day}" else day
  "#{year}-#{month}-#{day}"

# Returns diff in days between two dates
#
# @param {Date} date1
# @param {Date} date2
# @param {Boolean} abs if need to get absolute value
#
# @return {Number} in days
daysDiff = (date1, date2, abs) ->
  diff = if abs then Math.abs(date1 - date2) else date1 - date2
  Math.ceil(diff / (1000 * 3600 * 24))


# Returns days in current month
#
# @param {Date} date
#
# @return {Number}
daysInMonth = (date = new Date()) ->
  date = new Date(date)
  date.setMonth(date.getMonth() + 1)
  date.setDate(0)
  date.getDate()

# Add days to date
#
# @param {Date} date
# @param {Number} days
#
# @return {Date} new Date instance
addDays = (date = new Date(), days) ->
  date = new Date(date)
  date.setDate(date.getDate() + days)
  date

# Add months to date
#
# @param {Date} date
# @param {Number} months
#
# @return {Date} new Date instance
addMonths = (date = new Date(), months) ->
  date = new Date(date)
  date.setDate(1)
  date.setMonth(date.getMonth() + months)
  date

# Add years to date
#
# @param {Date} date
# @param {Number} years
#
# @return {Date} new Date instance
addYears = (date = new Date(), years) ->
  date = new Date(date)
  date.setYear(date.getFullYear() + years)
  date

# Get dates range from strings
# @return {array} ["2016-10-08".."2016-10-31" ]
# Range by days from startDate to returnDate
#
# @param {Date} startDate
# @param {Date} endDate
#
# @return {[Date]} Array of Dates by dats
getDatesRange = (startDate, endDate) ->
  start = new Date(startDate)
  end = new Date(endDate)
  range = [startDate]
  while start < end
    newDate = addDays(start, 1)
    range.push(newDate)
    start = newDate
  range

# Range by months from startDate to returnDate
#
# @param {Date} startDate
# @param {Date} endDate
#
# @return {[Date]} Array of Dates by months
getDatesMonthRange = (startDate, endDate) ->
  start = new Date(startDate)
  end = new Date(endDate)
  range = [startDate]
  while start < end
    newDate = addMonths(start, 1)
    range.push(newDate)
    start = newDate
  range

# year is leap?
#
# @param {Date|Number} ) The Date instance or full year number.
#
# @return {Boolean}
isLeap = (year = new Date()) ->
  year = year.getFullYear() if year instanceof Date
  new Date(year, 1, 29).getMonth() is 1

# Returns true if day, month and year is equals
#
# @param {Date} firstDate
# @param {Date} lastDate  The [description].
#
# @return {Boolean}
isEqualDates = (firstDate = new Date(), lastDate = new Date) ->
  firstDate.getDate() is lastDate.getDate() and
    firstDate.getMonth() is lastDate.getMonth() and
      firstDate.getFullYear() is lastDate.getFullYear()

# Returns true if month and year is equals
#
# @param {Date} firstDate
# @param {Date} lastDate  The [description].
#
# @return {Boolean}
isEqualMonths = (firstDate = new Date(), lastDate = new Date) ->
  firstDate.getMonth() is lastDate.getMonth() and
    firstDate.getFullYear() is lastDate.getFullYear()

module.exports = {
  formatDate: require('./format_date')
  dateToISO,
  daysDiff,
  daysInMonth,
  getDatesRange,
  getDatesMonthRange,
  isLeap,
  isEqualDates,
  isEqualMonths,
  addDays,
  addMonths,
  addYears
}
