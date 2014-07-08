describe 'HeapTest', ->
  describe '#emptyHeap', ->
    it '#newInstance', ->
      heap = new Heap
      assert.ok typeof heap is 'object', 'create new heap object'

    it '#emptyCheck', ->
      heap = new Heap
      assert.ok heap.isEmpty, 'heap should be empty'
      assert.equal do heap.size, 0, 'heap should have 0 elements'

    it '#methodsThatFailOnEmptyHeap', ->
      heap = new Heap
      assert.isUndefined do heap.peek, "can't peek into empty heap"

  describe '#insertion', ->
    it '#undefined', ->
      heap = new Heap
      assert.ok heap.isEmpty, 'heap should be empty when nothing is inserted'
      wrapper = -> insertionIndex = heap.insert null
      assert.throws wrapper, 'cannot insert undefined values'

    it '#number', ->
      heap = new Heap
      assert.equal heap.insert 5, 0,
        'the first element should be inserted at index 0'
