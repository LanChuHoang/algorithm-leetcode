function twoSum(nums, target) {
  const map = {};
  for (let i = 0; i < nums.length; i++) {
    const currentEl = nums[i];
    const toFindEl = target - currentEl;
    const foundIndex = map[toFindEl];
    if (foundIndex !== undefined) return [i, foundIndex];
    map[currentEl] = i;
  }
}

console.log(twoSum([2, 7, 11, 15], 9));
console.log(twoSum([3, 2, 4], 6));
console.log(twoSum([3, 3], 6));
