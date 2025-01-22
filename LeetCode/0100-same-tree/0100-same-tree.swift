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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return bfs(p) == bfs(q) 
    }

    func bfs(_ root: TreeNode?) -> [Int?] {
        guard let root = root else { return [] }
        var node: TreeNode? = root
        var queue: [TreeNode] = [root]
        var queueIndex: Int = 0
        var treeArray: [Int?] = [node?.val]

        while queueIndex < queue.count {
            node = queue[queueIndex]

            treeArray.append(node?.left?.val)
            treeArray.append(node?.right?.val)

            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
            
            queueIndex += 1
        }

        return treeArray
    }
}