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
