/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return  []}

        var output: [Int] = []
        func dfs(_ root: TreeNode) {
            guard root.left != nil || root.right != nil 
            else { 
                output.append(root.val)
                return 
            }

            if let left = root.left {
                dfs(left)
            }
            output.append(root.val)
            
            if let right = root.right {
                dfs(right)
            }
        }

        dfs(root)

        return output
    }
}