describe 'HeapTest', ->
  describe '#emptyHeap', ->
    it '#newInstance', ->
      heap = new Heap
      assert.ok typeof heap is 'object', 'create new heap object'

    it '#emptyCheck', ->
      heap = new Heap
      assert.ok heap.isEmpty, 'heap should be empty'
      assert.equal heap.size(), 0, 'heap should have 0 elements'

    it '#methodsThatFailOnEmptyHeap', ->
      heap = new Heap
      assert.isUndefined heap.peek(), "can't peek into empty heap"
