function binarySearch(n, arr = [], startIndex = 0, endIndex = arr.length - 1) {
  if (startIndex > endIndex) return undefined;
  const midIndex = Math.floor((endIndex + startIndex) / 2);
  const midEl = arr[midIndex];
  if (n === midEl.num) return midEl.index;
  if (n < midEl.num) return binarySearch(n, arr, startIndex, midIndex - 1);
  if (n > midEl.num) return binarySearch(n, arr, midIndex + 1, endIndex);
}

function twoSum(nums, target) {
  const length = nums.length;
  const sortedNums = nums
    .map((num, i) => ({ num, index: i }))
    .sort((a, b) => a.num - b.num);

  for (let i = 0; i < length; i++) {
    const currentEl = sortedNums[i];
    const toFindEl = target - currentEl.num;
    const foundIndex = binarySearch(toFindEl, sortedNums, i + 1, length - 1);
    if (foundIndex !== undefined) return [currentEl.index, foundIndex];
  }
}

console.log(twoSum([2, 7, 11, 15], 9));
console.log(twoSum([3, 2, 4], 6));
console.log(twoSum([3, 3], 6));
