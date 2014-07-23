describe 'heap test', ->
  beforeEach (done) ->
    @heap = new Heap
    do done

  describe 'empty heap tests', ->
    it 'create new instance', ->
      assert.ok typeof @heap is 'object', 'create new heap object'

    it 'empty heap should have no elements', ->
      assert.ok @heap.isEmpty, 'heap should be empty'
      assert.equal do @heap.size, 0, 'heap should have 0 elements'

    it 'peek call on empty heap returns undefined', ->
      assert.isUndefined do @heap.peek, "can't peek into empty heap"
