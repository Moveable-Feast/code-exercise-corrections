nums = [1,2,3]
nums_old = nums
nums_new = nums.copy()
nums_new = [4,5,6]
nums = nums_new.copy()
print(nums, nums_new, nums_old)