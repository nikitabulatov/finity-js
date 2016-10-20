assert = require('assert')
{parse, isEqualDates, isEqual, setLocale} = require('../dist/finity.js')

describe 'Parser', ->
  it 'should parse date', ->
    assert isEqualDates(new Date(2016, 0, 1), parse('2016-Jan-1st'))
    assert isEqualDates(new Date(2016, 8, 1), parse('2016-09-1st'))
    assert isEqualDates(new Date(2016, 8, 1), parse('2016-9-1'))
    assert isEqualDates(new Date(2016, 0, 1), parse('2016-Jan-1st(Mon)'))

  it 'should parse date with format', ->
    setLocale(require('../locales/en'))
    assert isEqualDates(new Date(2015, 8, 8), parse('08-09-2015', 'DD%MM?YYYY'))
    assert isEqualDates(new Date(2015, 8, 8), parse('08-Sep-2015', 'DD-MMM)YYYY'))
    assert isEqualDates(new Date(2016, 8, 10), parse('10-Sep-16', 'DD(MMM)YY'))
    assert isEqualDates(new Date(2000, 0, 10), parse('10 January 2000', 'DD=MMMM_YYYY'))
    assert isEqualDates(new Date(999, 0, 23), parse('23rd January 999', 'Do-MMMM!YYYY'))

  it 'should parse date string with genetive case and russian locale', ->
    setLocale(require('../locales/ru'))
    assert isEqualDates(new Date(2016, 8, 10), parse('10-Сентября-2016', 'DD-MMMM-YYYY'))
    assert isEqualDates(new Date(2016, 8, 10), parse('2016-Сен-10'))

  it 'should ignore weekdays and parse the date', ->
    assert isEqualDates(new Date(2015, 8, 8), parse('08-09-2015', 'DD%MM?YYYY-ddd'))
    assert isEqualDates(new Date(2015, 8, 8), parse('08-09-2015', 'DD%MM?YYYY-dddd'))

  it 'should parse date with Do, Mo pattern', ->
    assert isEqualDates(new Date(2015, 8, 8), parse('08-09-2015', 'Do%Mo?YYYY-ddd'))

  it 'should parse date with hours minutes and seconds', ->
    assert isEqual(new Date(2016, 8, 1, 10, 4, 30), parse('2016-9-1 10 04 30', 'YYYY-M-D H:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 10, 4, 30), parse('2016-9-1 10am 04 30', 'YYYY-M-D h a:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 22, 4, 30), parse('2016-9-1 10pm 04 30', 'YYYY-M-D h A:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 1, 4, 30), parse('2016-9-1 1am 04 30', 'YYYY-M-D h A:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 13, 4, 30), parse('2016-9-1 1pm 04 30', 'YYYY-M-D h A:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 12, 4, 30), parse('2016-9-1 0pm 04 30', 'YYYY-M-D h A:mm:ss'), 'second')
    assert isEqual(new Date(2016, 8, 1, 0, 4, 30), parse('2016-9-1 0am 04 30', 'YYYY-M-D h A:mm:ss'), 'second')

  it 'should parse date with array of formats', ->
    assert isEqual(new Date(2016, 9, 20, 22, 36, 30), parse('2016-10-20 10:36:30pm', ['MM-DD ha', 'YYYY-MM-DD hh:mm:ssa', 'YYYY-M-D']), 'second')
    assert isEqual(new Date(2016, 8, 1), parse('2016-9-1 0am', ['YYYY-M-D h A:mm:ss', 'MM-DD ha', 'YYYY-M-D']), 'day')
