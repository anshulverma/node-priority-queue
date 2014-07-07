{arg} = require './preconditions'

DEFAULT_COMPARATOR = (value1, value2) ->
  arg value1? and value2?, 'undefined values not allowed'
  arg typeof value1 is typeof value2, 'cannot compare different types'

  valueType = typeof value1
  return switch valueType
    when "string"
      if value1 > value2 then 1 else -1
    when "number" then value1 - value2
    else throw new Error "cannot compare value of type #{valueType}"

class Heap
  constructor: (@comparator = DEFAULT_COMPARATOR, arr = []) ->
    @heap = heapify arr, @comparator

  peek: ->

  extractRoot: ->

  insert: ->

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
    heap.push value
    index = heap.length - 1
    heapUp heap, index

  heapUp = (heap, index) ->
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
