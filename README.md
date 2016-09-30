# finity-js
## Without dependencies. Really lightweight date helpers library

### format
Returns format date by pattern
*Arguments*
`Date`: The date to process
`String`: The pattern for formatting date
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

### diff
Subtracts the first element of the second   
*Arguments*   
`Date`: The first date    
`Date`: The last date   
`Boolean`*\**: If you need to get absolute value    
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

### getLocale
Returns current locale    
*Arguments*   
`String`*\**: key of locale   
*Returns*:    
`Object`: Returns object(locale) if called without key    
`*`: Returns value of locale by object key
