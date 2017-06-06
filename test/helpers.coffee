{assert} = require('chai')
f = require('../dist/finity.js')

describe 'Helpers', ->
  it 'should calc days diff', ->
    d1 = new Date(2016, 9, 1)
    d2 = new Date(2016, 9, 3)
    assert.equal(-2, f.diff(d1, d2))
    assert.equal(2, f.diff(d1, d2, true))

  it 'should check equal dates', ->
    d1 = new Date(2016, 10, 20, 10)
    d2 = new Date(2016, 10, 20, 20)
    assert f.isEqualDates(d1, d2)
    assert.isNotOk(f.isEqualDates(d1, Infinity))

  it 'should check date in min and max range', ->
    d = new Date(2016, 10, 20)
    min = new Date(2016, 10, 20)
    max = new Date(2017, 10, 20)
    assert f.isDateInRange(d, min, max)
    assert f.isDateInRange(d, min, min)

  it 'should calc day of year', ->
    assert.equal(20, f.dayOfYear(new Date(2016, 0, 20)))
    assert.equal(20, f.dayOfYear(new Date(2016, 0, 20, 0, 0, 0)))
    assert.equal(20, f.dayOfYear(new Date(2016, 0, 20, 15, 33, 59)))
