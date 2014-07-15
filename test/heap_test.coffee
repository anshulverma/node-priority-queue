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

  describe 'insertion tests', ->
    it 'heap should not allow undefined values', ->
      assert.ok @heap.isEmpty, 'heap should be empty when nothing is inserted'
      wrapper = => insertionIndex = @heap.insert null
      assert.throws wrapper, 'cannot insert undefined values'

    describe 'insertion tests with numbers', ->
      it 'insert first element', ->
        assert.equal @heap.insert(5), 0,
          'the first element should be inserted at index 0'
        assert.notOk do @heap.isEmpty,
          'heap should not be empty after a element is inserted'
        assert.equal do @heap.size, 1, 'heap should have one element'
        assert.equal do @heap.peek, 5, 'peeking into the heap should return 5'
