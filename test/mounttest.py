#!/usr/bin/env python
import unittest
from mounttab2 import parse_mounts

class TestMount(unittest.TestCase):
    """
    我们的基本测试类
    """

    def  test_parsemount(self):
        """
        实际测试、
        任何以 ‘ test_' 开头的方法都被视为测试用例
        """

        result = parse_mounts()
        self.assertIsInstance(result,list)
        self.assertIsInstance(result[0],tuple)

    def test_rootext4(self):
        """
        测试找出根文件系统
        """
        result = parse_mounts()
        for line in result:
            if line[1] == '/' and line[2] != 'rootfs':
                self.assertEqual(line[2], 'ext4')

if __name__ == '__main__':
    unittest.main()
