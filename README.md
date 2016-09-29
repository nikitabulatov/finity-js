# finity-js
## Really lightweight date helpers library

### format
Format date with pattern
Patterns format:
* `dd` -> 02
* `Do` -> 1st
* `DDD` -> Fri
* `DDDD` -> Friday
* `mm` -> 09
* `MMM` -> Sep
* `MMMM` -> September
* `yyyy` -> 2016
* `yy` -> 16

example:
```javascript
var finity = require('finity');
finity.format(new Date(), 'dd (DDD) MMM yyyy');
```
returns:
`30 (Fri) Sep 2016`

one more:
```javascript
var finity = require('finity');
var ru = require('finity/locales/ru');
finity.setLocale(ru); // set Russian locale
finity.format(new Date(), 'dd (DDDD) MMMM yyyy', true); // use genitive case
```
returns:
`30 (Пятница) Сентября 2016`

### diff
Returns diff in days between two dates

### daysInMonth
Returns days in month

### addDays
Add days to date. Returns new Date instance

### addMonths
Add months to date. Returns new Date instance

### addYears
Add years to date. Returns new Date instance

### getDatesRange
Returns range by days from startDate to returnDate

### getDatesMonthRange
Returns range by months from startDate to returnDate

### isLeap
year is leap?

### isEqualDates
Returns true if day, month and year is equals

### isEqualMonths
Returns true if month and year is equals

### setLocale
Set locale for formatting
