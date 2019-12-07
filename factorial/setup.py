#!/usr/bin/env python3
""" Factorial project"""
from setuptools import find_packages,setup

setup(name = 'factorial', # 注意这里的name不要使用factorial相关的名字，因为会重复，需要另外取一个不会与他人重复的名字
        version = '0.1',
        description = "Factorial module.",
        long_description = "A test module for our book.",
        platforms = ["Linux"],
        author="ShiYanLou",
        author_email="support@shiyanlou.com",
        url="https://www.shiyanlou.com/courses/569",
        license = "MIT",
        packages=find_packages()
        )
