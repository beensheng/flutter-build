#!/usr/bin/env node

const program = require('commander')
const chalk = require('chalk')
const ora = require('ora')
const download = require('download-git-repo')
const {
    execSync
} = require('child_process');
const fs = require('fs');
const path = require('path');

const binPath = path.resolve(`${__dirname}/../template`);
const currentPath = process.cwd();
program
    .usage('[project-name]')
program.parse(process.argv)
// 当没有输入参数的时候给个提示
if (program.args.length < 1) return program.help()

// 获取项目名
let PRO_NAME = program.args[0]
if (!PRO_NAME) {
    console.log(chalk.red('\n Project Name should not be empty! \n '))
    return
}
// 出现加载图标
const spinner = ora("Start generating...\n");
spinner.start();

// 执行官方命令创建项目
const cmd = `flutter create ${PRO_NAME}`
execSync(cmd, function (error, stdout, stderr) {
    console.log(error, stdout, stderr);
});

// 模板对象
const model = {
    PRO_NAME
}

readTemplate( path.resolve(`${binPath}`))

// 安装第三方包
execSync(`cd ${PRO_NAME} && flutter pub get`, function (error, stdout, stderr) {
    console.log(error,stdout, stderr);
});

 // 结束加载图标
 spinner.succeed('Generation completed!');

/**
 * 替换模板变量并写入文件
 * @param {any} content 文件内容
 * @param {any} writeDir 写入文件夹
 */
function writeTemplate(content, writeDir) {
    const reg = /\{\{(.*?)\}\}/igs
    let result;
    while (result = reg.exec(content)) {
        const strKey = result[1].trim() //去空白
        const strValue = model[strKey] 
        //将模板中的语法位置替换为要响应的数据
        content = content.replace(result[0], strValue)
    }

    fs.writeFileSync(writeDir, content, err => {
        if (err) throw err
    })
    console.log("File: " + writeDir + " created successfully!");
}

function readTemplate(filePath) {
    const files = fs.readdirSync(filePath);
    //遍历读取到的文件列表
    files.forEach(function (filename) {
        const fileDir = path.join(filePath, filename); // 该文件绝对路径
        const stats = fs.statSync(fileDir); // 状态值
        const isFile = stats.isFile(); //是文件
        const isDir = stats.isDirectory(); //是文件夹
        const makePath = fileDir.replace(binPath,path.resolve(`${currentPath}/${PRO_NAME}`)); // 该文件存放路径
        if (isFile) {
            const content = fs.readFileSync(fileDir, 'utf-8'); // 读取文件内容
            writeTemplate(content, makePath)
        }
        if (isDir) {
            if (!fs.existsSync(makePath)) {
                if (!fs.mkdirSync(makePath)) {
                    console.log("Directory： " + makePath + " created successfully!");
                }
            }
            readTemplate(fileDir); //递归，如果是文件夹，就继续遍历该文件夹下面的文件
        }
        
    });
}


