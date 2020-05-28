###如何使用
1. 直接命令下达  
    `./ScriptName.sh`
2. Bash 程序运行  
    `sh ScriptName.sh`（子shell）  
    `source ScriptName.sh` （当前 shell）
  	
###注释
使用 `#` 进行单行注释，没有多行注释（但可以使用 [这些方法](https://zhuanlan.zhihu.com/p/54494213) 来实现多行注释的功能）  
特殊注释 `#!`：告诉解释器使用的 shell 名称
	
###变量
1. 定义  
显式赋值: `var="string"`（没有空格）  
语句赋值: ``for file in `ls /etc` ``
2. 使用  
    `$var`  
    `${var}`
3. shell 默认变量（$0,$1...）和 `shift`  
    * 默认变量
    ```
        /path/to/scriptname  opt1  opt2  opt3  opt4 
               $0             $1    $2    $3    $4
    ```  
   `$#` ：代表后接的参数个数；  
   `$@` ：返回每个参数，代表『 "$1" "$2" "$3" "$4" 』，每个变量是独立的(用双引号括起来)；  
   `$*` ：以单字符串返回所有参数，代表『 "$1c$2c$3c$4" 』，其中 c 为分隔字节，默认为空白键。  
   越界访问不会报错，返回空  
   * `shift`：参数变量号码的偏移  
   ```
        /path/to/scriptname  opt1  opt2  opt3  opt4 
               $0             $1    $2    $3    $4 
        使用 shift 命令后，相当于：
        /path/to/scriptname  opt2  opt3  opt4 
               $0             $1    $2    $3   
        可以使用 shift n 使参数移动 n
   ```
   
  
###字符串
1. 表示
    * 单引号  
    ```bash
        str='String' 
        echo $str 
        # 输出 String
    ```  
     原样输出，不能使用变量，不会转义。  
       
    * 双引号   
    ```bash
        var="s"
        str="string \"${var}\" "
        echo -e $str
        # 输出 string "s" 
    ```   
   可以使用变量和转义符
2. 操作
    * 拼接
    ```bash
       var="world"
       string1="hello,"$var"!"    # 也可以使用 "hello,${var}!"
       string2='hello,'$var'!'
       # 输出均为 hello,world!
    ```
    * 获取长度
    ```bash
       str="string"
       echo ${#str}
       # 输出 6
    ```
    * 提取子字符串
    ```bash
       str="long long string"
       echo ${str:1:4}
       # 输出 ong
       # 越界不会报错
    ```
###数组
1. 定义  
    ```bash
        arr=(var0 var1 ... varn)  
        # 或  
        arr[0]=var0 
        arr[1]=var1 
        arr[2]=var2
   ```  
2. 读取  
    `${arr[index]}`
3. 获取数组中所有元素  
    `${arr[*]}` 或 `${arr[@]}` 
4. 获取数组长度  
    `${#arr[*]}` 或 `${#arr[@]}`
   
###判断
1. `test` 命令（参考 [这个表格](http://cn.linux.vbird.org/linux_basic/0340bashshell-scripts_3.php#test) ）  
    * 数值测试
    * 字符串测试  
    * 文件测试
2. 判断符号 ` [ ] `  
    ```
    [  "$HOME"  ==  "$MAIL"  ]
     ↑         ↑   ↑       ↑  
    ```  
   注意：
   * 在中括号 [] 内的每个组件都需要有空白键来分隔；
   * 在中括号内的变量，最好都以双引号括起来；
   * 在中括号内的常数，最好都以单或双引号括起来。
   
###流程控制
1. if 语句  
    ```
       if [ 条件 ] 
       then 
           command
       fi
       # 或
       if [ 条件 ]; then
           command
       fi
       # 多重条件
       if [ 条件一 ]; then
           command1
       elif [ 条件二 ]; then
           command2
       else
           command3
       fi
    ```
4. case 语句  
    ```
        case 值 in
        模式1)
            command         
            ;;
        # ;; 表示 break 
        模式2）
            command
            ;;
        *)
        # 类似于 default
            command
            ;;
        esac
    ```
2. for 循环  
    ```
        for var in con1 con2 ... conN
        do
            command
        done
        # 或
        for((assignment;condition;next))
        do
            command
        done;
        # 变量调用不需要加 `$`
    ```
3. while 语句   
    ```
       while [ condition ]
       do
           command
       done 
    ```
1. until 语句  
    ```
        # condition 成立时跳出循环
        until [ condition ]
        do
            command
        done
    ```
5. 跳出循环  
    使用 `break` 和 `continue`
   
###函数
1. 定义  
    ```  
   # 在程序的前面定义
   [ function ] funname [()]     
     {     
         action;
         [return int;] 
     }
    ```  
2. 使用  
    直接使用函数名调用，命令执行结果可以作为条件语句使用（**注意，0 代表 true**）
###高级使用
1. 正则表达式
    * `grep`
    * `awk`
    * `sed`
2. I/O
3. 网络编程