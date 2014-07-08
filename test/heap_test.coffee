describe 'heap test', ->
  describe 'empty heap tests', ->
    it 'create new instance', ->
      heap = new Heap
      assert.ok typeof heap is 'object', 'create new heap object'

    it 'empty heap should have no elements', ->
      heap = new Heap
      assert.ok heap.isEmpty, 'heap should be empty'
      assert.equal do heap.size, 0, 'heap should have 0 elements'

    it 'peek call on empty heap returns undefined', ->
      heap = new Heap
      assert.isUndefined do heap.peek, "can't peek into empty heap"

  describe 'insertion tests', ->
    it 'heap should not allow undefined values', ->
      heap = new Heap
      assert.ok heap.isEmpty, 'heap should be empty when nothing is inserted'
      wrapper = -> insertionIndex = heap.insert null
      assert.throws wrapper, 'cannot insert undefined values'

    it 'insert a number', ->
      heap = new Heap
      assert.equal heap.insert(5), 0,
        'the first element should be inserted at index 0'
