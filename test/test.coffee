f = require('../dist/finity.js')
assert = require('assert')

describe 'DateFormat', ->
  it 'should format date', ->
    assert.equal('30/09/2016', f.formatDate(new Date(2016, 8, 30), 'dd/mm/yyyy'))
    assert.equal('30?09?2016', f.formatDate(new Date(2016, 8, 30), 'dd?mm?yyyy'))
