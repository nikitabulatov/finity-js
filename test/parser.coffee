assert = require('assert')
{parse, isEqualDates, setLocale} = require('../dist/finity.js')

describe 'Parser', ->
  it 'should parse date', ->
    assert isEqualDates(new Date(2016, 0, 1), parse('2016-Jan-1st'))
    assert isEqualDates(new Date(2016, 8, 1), parse('2016-09-1st'))
    assert isEqualDates(new Date(2016, 8, 1), parse('2016-9-1'))
    assert isEqualDates(new Date(2016, 0, 1), parse('2016-Jan-1st(Mon)'))

  it 'should parse date with format', ->
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
