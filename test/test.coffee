f = require('../dist/finity.js')
ru = require('../locales/ru.js')
en = require('../locales/en.js')
assert = require('assert')
d = new Date(2016, 8, 30)

describe 'Date format', ->
  it 'should format date', ->
    assert.equal('30/09/2016', f.format(d, 'dd/mm/yyyy'))
    assert.equal('30?09?2016', f.format(d, 'dd?mm?yyyy'))

  it 'should use locale', ->
    f.setLocale(en)
    assert.equal('30/Sep/2016', f.format(d, 'dd/MMM/yyyy'))
    assert.equal('30/September/2016', f.format(d, 'dd/MMMM/yyyy'))
    f.setLocale(ru)
    assert.equal('30/Сен/2016', f.format(d, 'dd/MMM/yyyy'))
    assert.equal('30/Сентябрь/2016', f.format(d, 'dd/MMMM/yyyy'))

  it 'should use genitive months', ->
    f.setLocale(ru)
    assert.equal('30 (Пятница) Сентября 2016', f.format(d, 'dd (DDDD) MMMM yyyy', true))

  it 'should format date with weekdays', ->
    f.setLocale(en)
    assert.equal('30 (Fri) Sep 2016', f.format(d, 'dd (DDD) MMM yyyy'))

  it 'should format date with postifx', ->
    f.setLocale(en)
    assert.equal('1st', f.format(new Date(2016, 8, 1), 'Do'))
    assert.equal('2nd', f.format(new Date(2016, 8, 2), 'Do'))
    assert.equal('3rd', f.format(new Date(2016, 8, 3), 'Do'))
    assert.equal('11th', f.format(new Date(2016, 8, 11), 'Do'))
    assert.equal('12th', f.format(new Date(2016, 8, 12), 'Do'))
    assert.equal('13th', f.format(new Date(2016, 8, 13), 'Do'))
    assert.equal('20th', f.format(new Date(2016, 8, 20), 'Do'))
    assert.equal('21st', f.format(new Date(2016, 8, 21), 'Do'))
    assert.equal('22nd', f.format(new Date(2016, 8, 22), 'Do'))
    assert.equal('23rd', f.format(new Date(2016, 8, 23), 'Do'))

describe 'Helpers', ->
  it 'should calc days diff', ->
    d1 = new Date(2016, 9, 1)
    d2 = new Date(2016, 9, 3)
    assert.equal(-2, f.diff(d1, d2))
    assert.equal(2, f.diff(d1, d2, true))
