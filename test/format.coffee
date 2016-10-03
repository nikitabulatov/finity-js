{format, setLocale} = require('../dist/finity.js')
ru = require('../locales/ru.js')
en = require('../locales/en.js')
assert = require('assert')
d = new Date(2016, 8, 30)

describe 'Date format', ->
  it 'should format date', ->
    assert.equal('30/09/2016', format(d, 'dd/mm/yyyy'))
    assert.equal('30?09?2016', format(d, 'dd?mm?yyyy'))

  it 'should use locale', ->
    assert.equal('30/Sep/2016', format(d, 'dd/MMM/yyyy'))
    assert.equal('30/September/2016', format(d, 'dd/MMMM/yyyy'))
    setLocale(ru)
    assert.equal('30/Сен/2016', format(d, 'dd/MMM/yyyy'))
    assert.equal('30/Сентябрь/2016', format(d, 'dd/MMMM/yyyy'))
    assert.equal('01/Сентябрь/2016', format(new Date(2016, 8, 1), 'dd/MMMM/yyyy'))

  it 'should use genitive months', ->
    setLocale(ru)
    assert.equal('30 (Пятница) Сентября 2016', format(d, 'dd (DDDD) MMMM yyyy', true))

  it 'should format date with weekdays', ->
    setLocale(en)
    assert.equal('30 (Fri) Sep 2016', format(d, 'dd (DDD) MMM yyyy'))

  it 'should format date with postifx', ->
    setLocale(en)
    assert.equal('1st', format(new Date(2016, 8, 1), 'Do'))
    assert.equal('2nd', format(new Date(2016, 8, 2), 'Do'))
    assert.equal('3rd', format(new Date(2016, 8, 3), 'Do'))
    assert.equal('11th', format(new Date(2016, 8, 11), 'Do'))
    assert.equal('12th', format(new Date(2016, 8, 12), 'Do'))
    assert.equal('13th', format(new Date(2016, 8, 13), 'Do'))
    assert.equal('20th', format(new Date(2016, 8, 20), 'Do'))
    assert.equal('21st', format(new Date(2016, 8, 21), 'Do'))
    assert.equal('22nd', format(new Date(2016, 8, 22), 'Do'))
    assert.equal('23rd', format(new Date(2016, 8, 23), 'Do'))
