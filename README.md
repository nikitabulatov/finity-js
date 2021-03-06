# finity-js
[![Build Status](https://travis-ci.org/nikitabulatov/finity-js.svg?branch=master)](https://travis-ci.org/nikitabulatov/finity-js)
## Without dependencies. Really lightweight date helpers library

## Usage:
```javascript
var finity = require('finity-js');

// Basic date formatter usage
finity.format(new Date(), 'DD (ddd) MMM YYYY');
// 30 (Fri) Sep 2016

// One more format date case
var ru = require('finity-js/locales/ru');
finity.setLocale(ru); // set Russian locale
finity.format(new Date(), 'DD (dddd) MMMM YYYY', true); // use genitive case
// 30 (Пятница) Сентября 2016

// Basic parser usage
finity.parse('2016-Jan-1st').toDateString()
// Fri Jan 01 2016

// You can try to parse date few times by array. (Here first format will be ignored)
finity.parse('2016-10-20 10:36:30pm', ['MM-DD ha', 'YYYY-MM-DD hh:mm:ssa', 'YYYY-M-D'])
// Returns new Date instance: Thu Oct 20 2016 22:36:30 GMT+0700 (ICT)

// Parse with known date string mask
finity.parse('08-09-2015', 'DD-MM-YYYY').toDateString()
// Tue Sep 08 2015
finity.parse('23rd January 999', 'Do MMMM YYYY').toDateString()
// Wed Jan 23  999
```

[Try it on runkit.com](https://runkit.com/npm/finity-js)

## Patterns for formatting and parsing date
Pattern | Result
------- | ------
`YYYY` 	| 1990 1991 1992 ..
`YY` 	| 90 91 92 ..
`MMMM` 	| January February March ..
`MMM` 	| Jan Feb Mar ..
`MM` 	| 01 02 03 ..
`M`		| 1 2 3 ..
`DD` 	| 01 02 03 ..
`Do`	| 1st 2nd 3rd ..
`D` 	| 1 2 3 ..
`dddd`	| Sunday Monday Tuesday ..
`ddd`	| Sun Mon Tue ..
`H` | 0 1 2 .. 23
`HH` | 00 01 02 .. 23
`h` | 1 2 3 .. 12
`hh` | 01 02 03 .. 12
`k` | 1 2 3 .. 24
`kk` | 01 02 03 .. 24
`m` | 1 2 3 .. 59
`mm` | 01 02 03 .. 59
`s` | 1 2 3 .. 59
`ss` | 01 02 03 .. 59


## Other date-helpers methods
### diff
Subtracts the first element of the second   
**Arguments**

 - `Date`: The first date
 - `Date`: The last date
 - `Boolean`(optional): If you need to get absolute value    

**Returns**:    
`Number`: Returns the difference in days    

### daysInMonth
Calculates quantity days in month   
**Arguments**

- `Date`: The Date instance with month to calculate   

**Returns**:    
- `Number`: Returns day number of last day in month

### addDays
Creates a new Date instance with added days   
**Arguments**

- `Date`: Date instance to process    
- `Number`: Number of days to add   

**Returns**:    
`Number`: Returns new Date instance with added days

### addMonths
Creates a new Date instance with added months   
**Arguments**

- `Date`: Date instance to process    
- `Number`: Number of months to add   

**Returns**:    
`Number`: Returns new Date instance with added months

### addYears
Creates a new Date instance with added years    
**Arguments**

- `Date`: Date instance to process    
- `Number`: Number of years to add    

**Returns**:    
`Number`: Returns new Date instance with added years    

### getDatesRange
Creates an array of Dates between two Dates   
**Arguments**

- `Date`: Date instance from    
- `Date`: Date instance to    

**Returns**:    
`Array`: Returns an array

### getDatesMonthRange
Creates an array of Dates between two Dates by months   
**Arguments**

- `Date`: Date from   
- `Date`: Date to   

**Returns**:    
`Array`: Array of Dates by months

### isLeap
Returns is leap year or not   
**Arguments**

- `Date`    

**Returns**:    
`Boolean`   

### isEqual
**Arguments**

- `Date`
- `Date`
- `String` — type of check: `year` or `month` or `day` or `hour` or `minute` or `second`

**Returns**:    
`Boolean`

### isEqualDates
Returns true if days, months and years is equals of both dates    
**Arguments**

- `Date`    
- `Date`    

**Returns**:    
`Boolean`

### isEqualMonths
Returns true if months and years is equals of both dates    
**Arguments**

- `Date`    
- `Date`    

**Returns**:    
`Boolean`   

### setLocale
Setting locale for formatting   
**Arguments**

- `Object`: keys: {previousMonth (`Array`), nextMonth (`Array`), months (`Array`), weekdays (`Array`), weekdaysShort (`Array`)}

### lastMonthDate
Creates a new Date instance with last day of month    
**Arguments**

- `Date`    

**Returns**:    
`Date`

### getMonthDates
Creates an array with Dates of month    
**Arguments**

- `Date`    

**Returns**:    
`Date`

### isDateInRange
Returns true if date in first argument is >= then date in second argument and <= then date in third argument    
Comparing only by days, not by hours    
**Arguments**

- `Date` The date to process    
- `Date` Min date    
- `Date` Max date    

**Returns**:    
`Boolean`   


### getLocale
Returns current locale    
**Arguments**

- `String`(optional): key of locale

**Returns**:
`*`

### utc
Returns new Date instance with UTC time
**Arguments**

- `Date`(optional): Date to process

**Returns**:
`Date`

**Returns**:    
`Object`: Returns object(locale) if called without key    
`*`: Returns value of locale by object key
