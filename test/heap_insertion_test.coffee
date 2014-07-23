{checkNumberType, checkContains} = require 'node-preconditions'

ORDER = {
  ASCENDING: 'ASCENDING'
  DESCENDING: 'DESCENDING'
}

class TestDataGenerator
  constructor: (@name) ->

  toString: ->
    @name

  buildSeries: (count, order, callback) ->
    checkContains order, ORDER, "unknown order '#{order}'"
    checkNumberType count, 'count must be a number'

    series = []
    item = do @random
    for i in [0..count]
      item = @nextInOrder item, order
      series.push item

    series

  nextInOrder: (item, order) ->
    item

class NumericalDataGenerator extends TestDataGenerator
  constructor: (name) ->
    super name

  random: ->
    Math.floor do Math.random * 100

  nextInOrder: (item, order) ->
    diff = do @random
    diff = -diff unless order is ORDER.DESCENDING
    item - diff

describe 'heap insertion test', ->
  beforeEach (done) ->
    @heap = new Heap
    do done

  it 'heap should not allow undefined values', ->
    assert.ok @heap.isEmpty, 'heap should be empty when nothing is inserted'
    wrapper = => insertionIndex = @heap.insert null
    assert.throws wrapper, 'cannot insert undefined values'

  generators = [new NumericalDataGenerator('numbers')]
  for generator in generators
    describe "insertion tests with #{generator}", ->
      it 'insert first element', ->
        value = do generator.random
        assert.equal @heap.insert(value), 0,
          'the first element should be inserted at index 0'
        assert.notOk do @heap.isEmpty,
          'heap should not be empty after a element is inserted'
        assert.equal do @heap.size, 1, 'heap should have one element'
        assert.equal do @heap.peek, value,
          "peeking into the heap should return #{value}"

      it 'insert in descending order', ->
        series = generator.buildSeries 10, ORDER.DESCENDING
        for item, index in series
          assert.equal @heap.insert(item), index,
            'insertion index should be same as position in order'

        assert.notOk do @heap.isEmpty, 'heap must not be empty'
        assert.equal do @heap.size, series.length,
          "heap must have #{series.length} items"
        assert.equal do @heap.peek, series[0],
          'largest element must be at the root'

      it 'insert in ascending order', ->
        series = generator.buildSeries 10, ORDER.ASCENDING
        for item, index in series
          assert.equal @heap.insert(item), 0,
            'largest element must be inserted at root'

        assert.notOk do @heap.isEmpty, 'heap must not be empty'
        assert.equal do @heap.size, series.length,
          "heap must have #{series.length} items"
        assert.equal do @heap.peek, series[series.length - 1],
          'largest element must be at the root'
