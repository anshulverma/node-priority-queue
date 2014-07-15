{checkArgument} = require 'node-preconditions'

DEFAULT_COMPARATOR = (value1, value2) ->
  checkArgument value1? and value2?, 'undefined values not allowed'
  checkArgument typeof value1 is typeof value2, 'cannot compare different types'

  valueType = typeof value1
  return switch valueType
    when "string"
      if value1 > value2 then 1 else -1
    when "number" then value1 - value2
    else throw new Error "cannot compare value of type #{valueType}"

class Heap
  @ROOT_INDEX = 0

  constructor: (@comparator = DEFAULT_COMPARATOR, arr = []) ->
    @heap = heapify arr, @comparator

  peek: ->
    @heap[Heap.ROOT_INDEX]

  extractRoot: ->

  insert: (value) ->
    insert @heap, value, @comparator

  merge: ->

  size: ->
    @heap.length

  isEmpty: ->
    @heap.length == 0

  heapify = (arr, comparator) ->
    heap = []
    insert heap, value, comparator for value in arr
    heap

  insert = (heap, value, comparator) ->
    checkArgument value, 'cannot insert undefined values'
    heap.push value
    index = heap.length - 1
    heapUp heap, index, comparator

  heapUp = (heap, index, comparator) ->
    index = swapWithParent heap, index until isHeapOrder heap, index, comparator
    index

  swapWithParent = (heap, index) ->
    {parentIndex} = getParent heap, index
    swap heap, index, parentIndex
    parentIndex

  isHeapOrder = (heap, index, comparator) ->
    if index is 0 then return true
    {parentValue} = getParent heap, index
    comparator(parentValue, heap[index]) > 0

  getParent = (heap, index) ->
    arg index > 0, 'root has no parent'
    {
      parentIndex: index / 2
      parentValue: heap[parentIndex / 2]
    }

  swap = (heap, index1, index2) ->
    value1 = heap[index1]
    heap[index1] = heap[index2]
    heap[index2] = value1

module.exports.Heap = Heap
