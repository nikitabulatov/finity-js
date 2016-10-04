# finity-js
## Without dependencies. Really lightweight date helpers library

### format
Returns format date by pattern
*Arguments*
`Date`: The date to process
`String`: The pattern for formatting date
`Object`(optional): Locale
*Patterns formats*:
* `dd` -> 02
* `Do` -> 1st
* `DDD` -> Fri
* `DDDD` -> Friday
* `mm` -> 09
* `MMM` -> Sep
* `MMMM` -> September
* `yyyy` -> 2016
* `yy` -> 16

*Returns*:    
`String`: The formatted date    
*Example*:    
```javascript
var finity = require('finity-js');
finity.format(new Date(), 'dd (DDD) MMM yyyy');
```
*Returns*:    
`30 (Fri) Sep 2016`   
*One more*:   
```javascript
var finity = require('finity-js');
var ru = require('finity-js/locales/ru');
finity.setLocale(ru); // set Russian locale
finity.format(new Date(), 'dd (DDDD) MMMM yyyy', true); // use genitive case
```
*Returns*:    
`30 (Пятница) Сентября 2016`    

### parse
Creates a Date from String    
*Arguments*   
`String`: The string to process   
`String`(optional): The pattern for formatting date   
`Object`(optional): Locale    
*Example*
```javascript
parse('2016-Jan-1st').toDateString() // Fri Jan 01 2016
parse('2016-09-1st').toDateString() // Thu Sep 01 2016
parse('2016-9-1').toDateString() // Thu Sep 01 2016
parse('2016-Jan-1st(Mon)').toDateString() // Fri Jan 01 2016
parse('08-09-2015', 'dd%mm?yyyy').toDateString() // Tue Sep 08 2015
parse('08-Sep-2015', 'dd-MMM)yyyy').toDateString() // Tue Sep 08 2015
parse('10 January 2000', 'dd=MMMM_yyyy').toDateString() // Mon Jan 10 2000
parse('23rd January 999', 'Do-MMMM!yyyy').toDateString() // Wed Jan 23  999
```

### diff
Subtracts the first element of the second   
*Arguments*   
`Date`: The first date    
`Date`: The last date   
`Boolean`(optional): If you need to get absolute value    
*Returns*:    
`Number`: Returns the difference in days    

### daysInMonth
Calculates quantity days in month   
*Arguments*   
`Date`: The Date instance with month to calculate   
*Returns*:    
`Number`: Returns day number of last day in month

### addDays
Creates a new Date instance with added days   
*Arguments*   
`Date`: Date instance to process    
`Number`: Number of days to add   
*Returns*:    
`Number`: Returns new Date instance with added days

### addMonths
Creates a new Date instance with added months   
*Arguments*   
`Date`: Date instance to process    
`Number`: Number of months to add   
*Returns*:    
`Number`: Returns new Date instance with added months

### addYears
Creates a new Date instance with added years    
*Arguments*   
`Date`: Date instance to process    
`Number`: Number of years to add    
*Returns*:    
`Number`: Returns new Date instance with added years    

### getDatesRange
Creates an array of Dates between two Dates   
*Arguments*   
`Date`: Date instance from    
`Date`: Date instance to    
*Returns*:    
`Array`: Returns an array

### getDatesMonthRange
Creates an array of Dates between two Dates by months   
*Arguments*   
`Date`: Date from   
`Date`: Date to   
*Returns*:    
`Array`: Array of Dates by months

### isLeap
Returns is leap year or not   
*Arguments*   
`Date`    
*Returns*:    
`Boolean`   

### isEqualDates
Returns true if days, months and years is equals of both dates    
*Arguments*   
`Date`    
`Date`    
*Returns*:    
`Boolean`

### isEqualMonths
Returns true if months and years is equals of both dates    
*Arguments*   
`Date`    
`Date`    
*Returns*:    
`Boolean`   

### setLocale
Setting locale for formatting   
*Arguments*   
`Object`: keys: {previousMonth (`Array`), nextMonth (`Array`), months (`Array`), weekdays (`Array`), weekdaysShort (`Array`)}

### lastMonthDate
Creates a new Date instance with last day of month    
*Arguments*   
`Date`    
*Returns*:    
`Date`

### getMonthDates
Creates an array with Dates of month    
*Arguments*   
`Date`    
*Returns*:    
`Date`

### isDateInRange
Returns true if date in first argument is >= then date in second argument and <= then date in third argument    
Comparing only by days, not by hours    
*Arguments*   
`Date` The date to process    
`Date` Min date    
`Date` Max date    
*Returns*:    
`Boolean`   


### getLocale
Returns current locale    
*Arguments*   
`String`(optional): key of locale   
*Returns*:    
`Object`: Returns object(locale) if called without key    
`*`: Returns value of locale by object key
