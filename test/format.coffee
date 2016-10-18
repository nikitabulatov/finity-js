{format, setLocale} = require('../dist/finity.js')
ru = require('../locales/ru.js')
en = require('../locales/en.js')
assert = require('assert')
d = new Date(2016, 8, 30)

describe 'Date format', ->
  it 'should format date', ->
    assert.equal('30/09/2016', format(d, 'DD/MM/YYYY'))
    assert.equal('30/9/2016', format(d, 'DD/M/YYYY'))
    assert.equal('30?09?2016', format(d, 'DD?MM?YYYY'))

  it 'should use locale', ->
    assert.equal('30/Sep/2016', format(d, 'DD/MMM/YYYY'))
    assert.equal('30/September/2016', format(d, 'DD/MMMM/YYYY'))
    setLocale(ru)
    assert.equal('30/Сен/2016', format(d, 'DD/MMM/YYYY'))
    assert.equal('30/Сентябрь/2016', format(d, 'DD/MMMM/YYYY'))
    assert.equal('01/Сентябрь/2016', format(new Date(2016, 8, 1), 'DD/MMMM/YYYY'))
    assert.equal('1/Сентябрь/2016', format(new Date(2016, 8, 1), 'D/MMMM/YYYY'))

  it 'should use genitive months', ->
    setLocale(ru)
    assert.equal('30 (Пятница) Сентября 2016', format(d, 'DD (dddd) MMMM YYYY', true))

  it 'should format date with weekdays', ->
    setLocale(en)
    assert.equal('30 (Fri) Sep 2016', format(d, 'DD (ddd) MMM YYYY'))

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

    assert.equal('1st', format(new Date(2016, 0, 1), 'Mo'))
    assert.equal('2nd', format(new Date(2016, 1, 2), 'Mo'))
    assert.equal('3rd', format(new Date(2016, 2, 3), 'Mo'))
    assert.equal('4th', format(new Date(2016, 3, 11), 'Mo'))
    assert.equal('5th', format(new Date(2016, 4, 12), 'Mo'))
    assert.equal('6th', format(new Date(2016, 5, 13), 'Mo'))
    assert.equal('7th', format(new Date(2016, 6, 20), 'Mo'))
    assert.equal('8th', format(new Date(2016, 7, 21), 'Mo'))
    assert.equal('9th', format(new Date(2016, 8, 22), 'Mo'))
    assert.equal('10th', format(new Date(2016, 9, 23), 'Mo'))
    assert.equal('11th', format(new Date(2016, 10, 23), 'Mo'))
    assert.equal('12th', format(new Date(2016, 11, 23), 'Mo'))
