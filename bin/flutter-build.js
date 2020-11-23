#!/usr/bin/env node
const program = require('commander')

// 定义当前版本
// 定义使用方法
program
 .version(require('../package').version)
 .usage('<command> [options]')
 .command('init', 'Build a new project, including router, exception capture, state management, API encapsulation and common widget')
 
// 解析命令行参数
program.parse(process.argv)