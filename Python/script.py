nums = [1, 2, 3, 4, 5, 6, 7]
n = len(nums)
k = 3

class Solution:
    def rotate(self, nums: list[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        for i in range(k):
            nums = [nums[n - 1]] + nums[0 : n - 1]

solution = Solution()
solution.rotate(nums, k)