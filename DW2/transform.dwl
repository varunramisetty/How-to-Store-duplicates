// How to store duplicates
//input 
// [0,1,2,3,4,5,1,4,6,8,7,7,7]

%dw 2.0
output application/json
---
// The code starts by taking the input array and extracting all of the distinct values.

{
distinctKeys: payload distinctBy $,
//By taking the input array and extracting all of the distinct values.
duplicatedKeys: flatten(payload groupBy ($) pluck ((value, key, index) -> value ) filter (sizeOf($) > 1 ) ) distinctBy ($)
//The code then flattens the result into a list of key-value pairs where each key is a value from the original array,
//and each value is an index in that original array.
// The code then flattens each group of two elements into one, so that they are all grouped by their index number.
//The third element in each sub-array is now a list containing both the value and its corresponding key from before.
}