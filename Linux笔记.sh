##马哥61天架构
#K:\Linux视频\马哥--架构--61天
###第二天
1、程序运行模式：
   用户空间(us)
   内核空间(sys)
  
2、POS:Portable Operating System 可移植操作系统
    别名：POSIX
    API：编程接口
    运行程序格式：
      Windows：EXE，库文件格式-->dll(dynamic link library)
      Linux：ELF，库文件格式-->so(shared object)
      
3、程序一般由2部分组成：指令+数据

申请内存：malloc()
释放内存：free()

问题：Centos和Linux是什么关系？Centos和RHEL是什么关系？
问题2：各种开原协议的具体细节(GPL,LGPL,Apache,BSD)

http://mirrors.aliyun.com
http://mirrors.sohu.com
http://mirrors.163.com


Linux 哲学思想：
  1. 一切皆文件
  2. 由众多单一的小程序组成，一个程序只实现一个功能
  3. 尽量避免更用户交互
  4. 使用纯文本文件保存配置信息
  
4、终端
  物理终端：直接接入本机的显示器和软件设备，设备文件：/dev/console
  虚拟终端：附加在物理终端之上的一软件方式虚拟实现的终端，Centos6 默认启动6个虚拟终端，Ctrl+Alt+F[1,6] 切换
    图形终端：附件在物理终端之上的以软件方式虚拟实现的终端，但额外会提供桌面环境
  虚拟终端和图形终端的设备文件路径：/dev/tty[1,7]
  模拟终端：图形界面下打开的命令行接口；基于ssh协议或TELNET协议等远程打开的界面
  模拟终端的设备文件路径：/dev/pts/[0,~]
  查看当前终端设备命令：tty

5、命令
  type 区分内外命令
  which/whereis 查看外部命令路径

6、文件系统
  文件有两类数据：
    元数据：metadata
    数据：data
   
  1. 文件名严格区分大小写
  2. 文件名可使用除 / 以外的任意字符(不建议使用特殊字符)
  3. 文件名长度不能超过255个字符
  4. 所有以 . 开头的文件，均为隐藏文件

7、使用命令帮助
  内部命令：help COMMAND
  外部命令：
    1. COMMAND --help
       COMMAND -h
    2. 使用手册：man COMMAND
    3. 信息页：info COMMAND
    4. 程序自身的帮助文档
       README
       INSTALL
       ChangeLog
    5. 程序官方文档
    6. 发行版的官方文档

history
  -a 追加本次会话新执行的命令历史列表至历史文件
  -d 删除历史文件中指定的命令
  -c 清空命令历史
  
  快捷操作：
  !n 执行历史中某条命令，n为自然数
  !! 执行上一条命令

 外部命令帮忙文档路径：/usr/share/man(文件压缩存档)
 man1:用户命令
 man2:系统命令
 man3:C库调用
 man4:设备文件及特殊文件
 man5:配置文件格式
 man6:游戏
 man7:杂项
 man8:管理类命令
 注：有些命令在不止一个章节中存在帮助文档
 man命令的配置文件：/etc/man.config
 
 SYNOPSIS:
 [] 可选内容
 <> 必选内容
 a|b 二选一
 ... 同一内容可出现多次
 
 http://redhat.com/docs
 
 ls
   atime 访问时间
   mtime 文件数据修改时间(m改变，c一定会改变)
   ctime 文件属性修改时间(c改变，m不一定改变)
 
 stat file (获取指定文件的元数据)
   

###第三天
/boot:引导文件存放目录，内核文件(vmlinuz)、引导加载器(bootloader,grub)
/bin:供所有用户使用的基本命令，OS启动即会用到的程序
/sbin:管理类的基本命令，OS启动即会用到的程序
/lib:基本的共享库文件，以及内核模块文件(/lib/modules)
/lib64:专用于x86_64系统上的辅助共享库文件
/etc:存放配置文件
/home:普通用户的家目录
/root:管理员的家目录
/media:便携式移动设备挂载点
/mnt:临时文件系统挂载点
/dev:设备文件及特殊文件
  b:块设备(随机访问)
  c:字符设备(线性访问)
/opt:第三方应用程序安装位置
/srv:系统上运行的服务用到的数据
/tmp:临时文件
/usr:universal shared read-only data
  include:C程序的头文件
  local:第三方应用程序的安装位置
/var:variable data files
  cache:应用程序缓存数据目录
  lib:应用程序状态信息数据
  local:专用于为/usr/local下的应用程序存储可变数据
  lock:锁文件
  log:日志目录文件
  opt:专用于为/opt下的应用程序存储可变数据
  run:运行中的进程相关的数据：通常用于存储进程的pid文件
  spool:应用程序数据池
  tmp:保存系统两次重启之间产生的临时数据
/proc:用于输出内核与进程信息相关的虚拟文件系统
/sys:用于输出当前系统上硬件设备相关信息的虚拟文件系统



1. 命令历史
  history
    环境变量
      HISTSIZE:命令历史记录条数
      HISTFILE:~/.bash_history
      HISTFILESIZE:命令历史文件记录历史的条数
      HISTCONTROL:控制命令历史的记录方式
        ignoredups:忽略连续且相同的重复命令
        ignorespace:忽略所有以空白开头的命令
        ignoreboth:以上两种都生效

2. tree 
  -d 只显示目录
  -L 指定显示层级数目
  
  
#第四天
1. 文件管理
  cp
    cp SRC DEST
      SRC是文件
        如果目标不存在：新建DEST，并将SRC中内容填充至DEST中
        如果目录存在：
          如果DEST是文件：将SRC中的内容覆盖至DEST中
          如果DEST是目录：在DEST下新建与源文件同名的文件，并将SRC的内容填充至新文件中
    cp SRC...  DEST
      SRC...：多个文件
        DEST必须存在，且为目录，其他情形均出错
    cp SRC DEST
      SRC是目录：
        则使用选项：-r
        如果DEST不存在：
          创建指定目录，复制SRC目录中所有文件至DEST中
        如果DEST存在：
          如果DEST是文件：保错
          如果DEST是目录：复制SRC目录中所有文件至DEST目录中
  
2. alias
  仅对当前用户：~/.bashrc
  对所有用户有效：/etc/bashrc
   
  unalias 撤销别名

3. bash进程重新读取配置文件
  source /path/to/config_file
  . /path/to/config_file
  
4. glob(globbing)
  bash中用于实现文件名“通配”
    通配符：*，?，[]
    a. *
      任意长度的任意字符
    b. ?
      任意单个字符
    c. []
      匹配指定范围内的任意单个字符
      
   
5. bash的I/O重定向及管道
标准输入：keyborad 0
标准输出：monitor 1
标准错误输出：monitor 2
I/O重定向：改变标准位置

输出重定向：COMMAND > NEW_POS,COMMAND >> NEW_POS
  >:覆盖重定向，目标文件中的原有内容会被清除
  >>:追加重定向，新内容会追加至目标文件尾部
  2>:覆盖重定向错误输出数据流
  2>>:追加重定向错误输出数据流
  标准输出和错误输出各自定向至不同位置
    COMMAND > /path/to/file.out 2> /path/to/file.err
    
  合并标准输出和错误输出为同一数据流进行重定向
    &>:覆盖重定向(方式1)
    (方式2)覆盖：COMMAND > /path/to/file.log 2> &1
    &>>:追加重定向(方式1)
    (方式2)追加：COMMAND >> /path/to/file.log 2>> &1    
   
  set -C:禁止将内容覆盖输出至已有文件
    强制覆盖：>|
  set +C:与-C功能相反
  
输入重定向：<
  tr 命令：转换或删除字符
    tr abc ABC < file.txt 将file.txt文件中的小写abc替换成大写ABC
    tr -d abc < file.txt 将file.txt中的abc删除
  
  cat >> test.txt << EOF
  ha ha ha 
EOF

管道
  COMMAND | COMMAND | COMMAND |...
  注：最后一个命令会在当前shell进程的子shell进程中执行
  
  tee 命令：一路输入，两路输出(覆盖至文件，-a追加至文件)

文本处理工具
  cut -d(指定分隔符) -f(指定输出列) --output-delimiter(指定输出分隔符)
  sort -r(倒序) -f(忽略字符大小写) -t(指定分隔符) -k(指定排序列) -n(按数值排序)
  uniq -c(显示重复次数) -d(只显示重复数据) -u(只显示未重复数据) 注：连续且完全相同方为重复
  
6. 用户和组管理
  Linux用户：Username/UID
    管理员：root/0
    普通用户：xxx/1-65535
      系统用户：1-499，1-999
        守护进程获取资源进行权限分配
      登录用户：500+，1000+
        交互式登录
        
  Linux组：Groupname/GID
    管理员组：root/0
    非管理员组：
      系统组：1-499，1-999
      普通组：500+，1000+
    
  Linux安全上下文：
    运行中的程序：进程
      以进程的发起者的身份运行
      进程所能够访问的所有资源取决于进程的发起者的身份
      
  Linux组的类别：
    用户的基本组(主组)
      组名同用户名，且仅包含一个用户：私有组
    用户的附加组(额外组)
    
  Linux用户和组的相关配置文件：
    /etc/passwd：用户及其属性信息
      以 : 分隔成7列
      用户名:密码(密码占位符):UID:GID(用户基本组ID):GECOS(备注):用户主目录:用户默认使用的shell     
    /etc/group：组及其属性信息
      组名:组密码占位符:GID:以当前组为附加组的用户列表
    /etc/shadow：用户密码及其相关属性
      以 : 分隔成9列
      登录名:密码(加密):最后一次修改密码日期:密码的最小使用时间:密码最大使用时间:警告时间(修改密码):密码禁用期(密码过期至用户锁定时间):账号的过期日期:保留字段
    /etc/gshadow：组密码及其相关属性
    
  用户和组相关的管理命令：
    创建用户：useradd/adduser  默认值设定：/etc/default/useradd
      -u：UID，UID值大小的定义在/etc/login.defs中
      -g：GID(数字或组名，事先存在)
      -d：用户家目录，复制到家目录的内容在/etc/skel/
      -s：用户登录使用的shell，可用列表在/etc/shells文件中
      -G：指定附加组(事先存在)
      -r：创建系统用户
      
  用户属性修改：usermod
    -d HOME：新家目录，原有目录中的文件不会同时移动至新的家目录；若要移动，则同时使用 -m 选项
    -l log_name：新用户名
    -L：lock指定用户
    -U：解锁指定用户    
    
  给用户添加/修改密码：passwd
    passwd username 修改指定用户的密码，只root用户
    passwd  修改自己的密码
    -l：lock指定用户
    -u：解锁
    -n：最短使用期限
    -x：最大使用期限
    -w：提前多少天提示密码过期
    -i：密码过期后，可使用密码登陆修改
    --stdin：从标准输入接收用户密码
        echo "PASSWD" | passwd --stdin USERNAME
        
  组属性修改：groupmod
    -n：group_name(新的组名)
    -g：GID(新的GID)
    
  组密码添加/修改：gpasswd
    -a：user group 向组中添加用户
    -d：user group 删除组中的用户
    -A：设置有管理权限的用户列表
    
  修改用户属性：chage
    -d, --lastday 最近日期        将最近一次密码设置时间设为“最近日期”
    -E, --expiredate 过期日期     将帐户过期时间设为“过期日期”
    -h, --help                    显示此帮助信息并推出
    -I, --inactive INACITVE       过期 INACTIVE 天数后，设定密码为失效状态
    -l, --list                    显示帐户年龄信息
    -m, --mindays 最小天数        将两次改变密码之间相距的最小天数设为“最小天数”
    -M, --maxdays 最大天数        将两次改变密码之间相距的最大天数设为“最大天数”
    -R, --root CHROOT_DIR         chroot 到的目录
    -W, --warndays 警告天数       将过期警告天数设为“警告天数”

  权限管理：
    文件：
      r：可使用文件查看类工具获取其内容
      w：可修改该其内容
      x：可以吧此文件提请内核启动为一个进程
      
    目录：
      r：可以使用ls查看此目录文件列表
      w：可在此目录中创建文件，也可删除此目录中的文件
      x：可以使用ls -l查看此目录中文件列表，可以cd进入目录
    
    文件或目录创建时的遮罩吗：umask(只对当前用户生效)
      FILE：666-umask
        Note：如果某类用户的权限减得的结果中存在x权限，则将其权限+1
      DIR：777-umask

##第五天
1. 机器语言简单介绍
  程序编程风格：
    过程式：以指令为中心，数据服务于指令
    对象式：以数据为中心，指令服务于数据
  
  高级语言：
    编译：高级语言-->编译器-->目标代码
      c、C++、java
    解释：高级语言-->解释器-->机器代码
      shell、perl、python

2. shell编程      
  shell编程：过程式、解释执行、弱类型语言、本身不支持浮点数
  
  运行脚本：
    1、给予执行权限，通过具体的文件路径指定文件执行 /path/to/xxx；. xxx
    2、执行运行解释器，将脚本作为解释器程序的参数运行：bash xxx；sh xxx
    
3. 基础正则表达式
  元字符：
    字符匹配：
      .：匹配任意单个字符
      []：配置指定范围内的单个字符
      [^]：匹配指定范围外的任意单个字符
    匹配次数：
      *：匹配前面的字符任意次
      \?：匹配前面的字符零次或一次
      \+：匹配前面的字符至少一次
      \{m\}：匹配前面的字符m次
      \{m,n\}：匹配前面的字符至少m次，至多n次
      \{m,\}：匹配前面的字符至少m次
    位置锚定：
      ^：行首锚定
      $：行尾锚定
        ^$：匹配空行
        ^[[:space:]]$：匹配空格
      \< 或 \b：词首锚定，用于单词模式的左侧
      \> 或 \b：词尾锚定，用于单词模式的右侧
    分组：
      \(\)：
        \(ab\+\(xy\)*\)
          \1：ab\+\(xy\)*
          \2：xy
      后向引用：引用前面的分组括号中的模式所匹配字符，而非模式本身
      
#第6天
1. bash基础特性
  bash中的变量种类：
    根据变量的生效访问等标准：
      本地变量：生效范围为当前shell进程，非自身进程都无效
      环境变量：生效范围为当前shell进程及其子进程  declare -x var=xxx
      局部变量：生效范围为当前shell进程中某代码片段(通常指函数)
      位置变量：$1,$2,$3,...，用于让脚本在脚本代码中调用通过命令行传递给它的参数
      特殊变量：$?,$0,$#,$*,$@
        注：$#可统计位置参数个数
   
  变量命名法则：
    不能使用程序中的保留字
    只能使用数字、字母及下划线，且不能以数字开头
    见名知意，尽量不要使用全大写
    
  本地变量：
    变量赋值：var='value'
      value：
        可以是直接字符串：var='usernme'
        变量引用：var2="${var}"
        命令引用：var=`COMMAND`，var=$(COMMAND)
    变量引用：${var},$var
      ""：弱引用，其中的变量引用会被替换为变量值
      ''：强引用，其中的变量引用不会被替换为变量值，而保持原字符串
    显示已定义的所有变量：
      set
    销毁变量：
      unset var
  
  环境变量：
    变量声明、赋值：
      export var=VALUE
      declare -x var=name
    变量引用：$var,${var}
    显示所有环境变量：
      export
      env
      printenv
    销毁：
      unset var
      
  只读变量：
    readonly var
    declare -r var

2. bash的配置文件
  生效范围：
    1)全局配置
      /etc/profile
        /etc/profile.d/*.sh
      /etc/bashrc
    2)个人配置
      ~/.bash_profile
      ~/.bashrc
  
  按功能划分：
    1)profile类：为交互式登录的shell提供配置
      全局：/etc/profile、/etc/profile.d/*.sh      
      个人：/etc/.bash_profile
      功用：
        1)用于定义环境变量
        2)运行命令或脚本
    2)bashrc类：为非交互式登录的shell提供配置
      全局：/etc/bashrc
      个人：~/.bashrc
      功用：
        1)定义命令别名
        2)定义本地变量
    注：两者可能会交叉使用对方的部分配置文件
    
  shell登录：
    交互式登录：
      直接通过终端输入账号密码登录
      使用"su - userName"或"su -l userName"切换的用户
      /etc/profile --> /etc/profile.d/*.sh --> ~/.bash_profile --> ~/.bashrc --> /etc/bashrc
    非交互式登录：
      su UserName
      图形界面下打开的终端
      执行脚本
      ~/.bashrc --> /etc/bashrc --> /etc/profile.d/*.sh
      
    编辑配置文件后使其生效的方式：
      1)重新启动shell进程
      2)使用 source 或者 . 命令进程
 
3. bash中的算术运算
  1) let var=算术表达式
  2) var=$[算数表达式]
  3) var=$((算数表达式))
  4) var=$(expr arg1 arg2 arg3 ...)
  bash内建的随机数生成器：$RANDOM
   
4. 条件测试
  测试命令：
    test EXPRESSION
    [ EXPRESSION ]
    [[ EXPRESSION ]]
    
  bash的测试类型：
    数值测试：
      -gt
      -ge
      -lt
      -le
      -eq
      -ne
    字符串测试(操作数都需加引号，否则容易得不到想要的结果)：
      ==：是否相等
      >：左边是否大于右边
      <：左边是否小于右边
      !=：两边是否不相等
      =~：左边字符串是否能够被右边的PATTERN所匹配
        注：此表达式一般用于 [[   ]]中
      -z：测试字符串是否为空，空为真，非空为假
      -n：测试字符串是否为非空，非空为真，空为假
    文件测试：
      -a FILE
      -e FILE：文件存在性测试，存在为真，否则为假
      -b FILE：文件是否为块设备
      -c FILE：文件是否为字符文件
      -d FILE：文件是否为目录
      -f FILE：文件是否为普通文件
      
5. bash用户交互及调试
  read [options] [var ...]
    -p：提示符
    -t：TIMEOUT
  bash -n /path/to/some_script
    检测脚本中的语法错误  
  bash -x /path/to/some_script
    单步执行脚本

## vim 编辑器
  使用：
    基本模式：
      编辑模式、命令模式
      输入模式
      末行模式
  
  打开文件：
    vim [OPTION]... FILE...
      +n：打开文件，直接让光标处于第n行的行首
      +/PATTERN：打开文件后，直接让光标处于第一个被PATTERN匹配到的行的行首
      +：打开文件，直接让光标处于末行的行首
    
  模式转换：
    编辑模式 --> 输入模式
      i：在光标所在处前面插入
      a：在光标所在处后面插入
      o：在当前光标所在行的下方打开一个新行
      I：在当前光标所在行的行首输入
      A：在当前光标所在行的行尾输入
      O：在当前光标所在行的上方打开一个新行
      c：
      C：
    输入模式 --> 编辑模式
      ESC
    编辑模式 --> 末行模式
      :
    末行模式 --> 编辑模式
      ESC EscEsc
      
  关闭文件：
    :q  退出
    :q! 强制退出，丢弃做出的修改
    :wq 保持退出
    :x  保存退出
    :w /path/to/somewhere
    命令模式下 ZZ  保存退出
  
  光标跳转：
    字符间跳转：
      h：左
      l：右
      j：下
      k：上
    单词间跳转：
      w：跳转至下一个单词的词首
      b：跳转至当前或前一个单词词首
      e：跳转至当前或下一个单词的词尾
    行首行尾跳转：
      ^：跳转至行首的第一个非空白字符
      0：跳转至行首
      $：跳转是行尾
    行间移动：
      nG：跳转至第n行
      G：最后一行
      gg：第一行
    句间移动：
      (
      )
    段落间移动：
      {
      }
  
  粘贴命令：
    p：缓冲区存的如果为整行，则粘贴当前光标所在行的下方；否则，则粘贴至当前光标所在处的后面
    P：缓冲区存的如果为整行，则粘贴当前光标所在行的上方；否则，则粘贴至当前光标所在处的前面
    
  复制命令：
    y：
    yy：复制行
    
  改变命令：
    c：修改，编辑模式 --> 输入模式
    
  可视化模式：
    v：按字符选定
    V：按行选定
 
  撤销操作：
    u：撤销此前的操作
    Ctrl+r：撤销此前的撤销

  .：点号，重复前一个编辑操作

  翻屏操作：
    Ctrl+f：向文件尾部翻一屏
    Ctrl+b：向文件首部翻一屏
    Ctrl+d：向文件尾部翻半屏
    Ctrl+u：向文件首部翻半屏

  vim自带的练习教程：vimtutor    
 
  查找并替换：
    s：在末行模式下完成查找替换操作
      s/要查找的内容/替换的内容/修饰符
        修饰符：
          i：忽略大小写
          g：全局替换
              
  定制vim的工作特性：
    配置文件：永久有效
      全局：/etc/vimrc
      个人：~/.vimrc
    
    1)行号
      显示：set number/nu
      取消显示：set nonumber/nonu
    2)括号匹配
      匹配：set showmatch/sm
      取消：set nosm
    3)自动缩进
      启用：set ai
      禁用：set noai
    4)高亮搜索结果
      启用：set  hlsearch
      禁用：set  nohlsearch
    5)语法高亮
      启用：syntax on
      禁用：syntax off
    6)忽略字符大小写
      启用：set ic
      不忽略：set noic
    
第7天
1. 文件查找：
    非实时查找(数据库查找)：locate
    实时查找：find
  
  find介绍：
    find [OPTION]... [查找路径] [查找条件] [处理动作]
      查找路径：指定具体目标路径，默认为当前目录
      查找条件：指定的查找标准，可以使文件名、大小、类型、权限等标准进行，默认为找出指定路径下的所有文件
      处理动作：对符合条件的文件做什么查操作，默认输出至屏幕
      
      查找条件：
        根据文件名查找：
          -name "文件名" ，支持使用glob(通配符)
          -iname "文件名"，不区分字母大小写
          -regex "PATTERN"，支持使用正则，以PATTERN匹配整个文件路径字符串，而不仅仅是文件名称
        根据文件属主、属组查找：
          -user USERNAME，查找属主为指定用户的文件
            示例：find /tmp -not -user root(查找tmp目录下属主不是root的文件或目录)
          -group GOUPNAME，查找属组为指定组的文件
          -uid UserID，查找属主为指定的UID号的文件
          -gid GroupID，查找属组为指定的GID号的文件
          -nouser，查找没有属主的文件
          -nogroup，查找没有属组的文件
        根据文件类型查找：
          -type TYPE：
            f：普通文件
            d：目录文件
            l：符号链接文件
            s：套接字文件
            b：块设备文件
            p：管道文件
            c：字符文件
        组合条件：
          与：-a
          或：-o
          非：-not，！
          示例：find / \(-nouser -o -nogroup\) -ls 查找没有属主或属组的文件并详细显示
          德摩根定律
        根据文件大小查找：
          -size [+|-]nUNIT
            常用单位：K、M、G
            nUNIT：(n-1,n]
            -nUNIT：[0,n-1]
            +nUNIT：(n,无穷大)
        根据时间戳查找：
          以天为单位：
            -atime [+|-]n
              n：[n,n+1)
              +n：(负无穷,n+1]
              -n：[0,n)
            -ctime [+|-]n
              同上
            -mtime [+|-]n
              同上
          以分钟问单位：
            -amin [+|-]n
              同上
            -cmin [+|-]n
              同上
            -mmin [+|-]n
              同上
        根据权限查找：
          -perm [+|-]MODE
            MODE：精确权限匹配，给啥找啥
            +MODE：任何一类(u,g,o)对象的权限中只要有一位匹配即可
              示例：find /etc -perm +033 (0表示任意权限，不去关心，可忽略；3表示，(所属组或其他用户)拥有写权限，或者执行权限)
                    find /etc -not -perm +222(/etc目录下所有用户都没有写权限的文件)
              注：centos7中是 /MODE 不是 +MODE 
            -MODE：每一类对象都必须同时拥有为其指定的权限标准
              示例：find /etc -perm +033 (0表示任意权限，不去关心，可忽略；3表示，所属组和其他用户同时拥有写权限和执行权限)
                    find /etc -not -perm -111(/etc目录下至少有一类用户没有执行权限的文件)
                     
      处理动作：
        -print：默认的处理动作，显示值屏幕
        -ls：类似于对查找的文件执行"ls -l"命令
        -delete：删除查找到的文件
        -fls /path/to/somefile：查找到的所有文件的长格式信息保存至指定文件中
        -ok COMMAND {} \; 对查找到的每个文件执行由COMMAND指定命令
          对于每个文件执行命令之前，会交互式要求用户确认
        -exec COMMAND {} \; 对查找到的每个文件执行由COMMAND指定命令，非交互
          {}：用于引用查找到的文件名称自身
        注：find传递查找到的文件至后面指定的命令时，查找到所有符合条件的文件一次性传递给后面的命令
          有些命令不能接受过多参数，此时命令执行可能会失败，解决方式如下
          find | xargs COMMAND
          
2. Linux文件系统上的特殊权限
  SUID，SGID，Sticky
  安全上下文：
    前提：进程有属主和属主，文件有属主和属组
    1)任何一个可执行程序文件能不能启动为进程，取决于发起者对程序文件是否有执行权限
    2)启动为进程之后，其进程的属主为发起者，属组为发起者所属的组
    3)进程访问文件时的权限，取决于进程的发起者
      进程的发起者，同文件的属主，这应用文件属主权限
      进程的发起者，属于文件的属组，则应用文件属组权限
      否则应用文件其他权限
  SUID
    1)任何一个可执行程序文件能不能启动为进程，取决于发起者对程序文件是否有执行权限
    2)启动为进程之后，其进程的属主为原程序文件的属主
    权限设定：
      chmod u+s FILE  
      chmod u-s FILE
  
  SGID
    默认情况下，用户创建文件时，其属组为此用户所属的基本组
    一旦某目录倍设定了SGID，则对此目录有写权限的用户在此目录创建的
    权限设定：
      chmod g+s DIR
      chmod g-s DIR

  Sticky
    对于一个多人可写的目录，如果设置了Sticky，则每个用户仅能删除自己的文件
    权限设置：
      chmod o+t DIR...
      chmod o+t DIR...
  SUID SGID STICKY
  4    2    1
    chmod 1777 /tmp/a.txt(1表示Sticky)
    
  SUID：占据属主的执行权限位
    s：属主在赋给SUID权限之前拥有x权限
    S：属主在赋给SUID权限之前没有x权限
  SGID：占据属组的执行权限位
    s：属组在赋给SGID权限之前拥有x权限
    S：属组在赋给SGID权限之前没有x权限
  STICKY：占据其他人的执行权限位
    t：其他人在赋给STICKY权限之前拥有x权限
    T：其他人在赋给STICKY限之前没有x权限
    
3. Linux磁盘管理 (f->UEFI,GPT)
  一切皆文件
    块设备：block存取单位“块”，磁盘
    字符设备：char，存取单位“字符”，键盘
    设备文件：关联至一个设备驱动程序，进而能够与之对应硬件设备进行通信
      设备号码
        主设备号：major number，标识设备类型
        次设备号：mionr number，标识同一类型下的不同设备
        
      硬盘接口类型：
        并行：
          IDE
          SCSI
        串口：
          SATA
          SAS
          USB
      /dev/DEV_FILE
        磁盘设备的设备文件命名：
        IDE：/dev/hd
        SCSI,SATA,SAS,USB：/dev/sd
          不同设备：a-z
            /dev/sda,/dev/sdb,.....
          同一设备上的不同分区：1,2,...
            /dev/sda1,/dev/sda5
      机械式硬盘：
        track：磁道
        cylinder：柱面
        secotr：扇区
          512bytes
        0磁道0扇区：512bytes
          MBR：Master Boot Record
            前446bytes：boot loader
            64bytes：分区表
              16bytes：标识一个分区
              4个主分区或者3个主分区+1扩展分区(n个逻辑分区，n>=5)
            2bytes
            
  分区管理工具：fdisk，parted，sfdisk  
    fdisk：对于一块硬盘来讲，对多只能管理15个分区    
      m：获取帮助
      p：显示已有分区
      n：创建
      d：删除
      w：写入磁盘并退出
      q：放弃更新并退出
      l：列表所有分区id
      t：调整分区id
    cat /proc/partitions 查看内核所识别的分区
    通知内核获取最新的磁盘分区
      partx -a  或 kpartx -a
      
4. Linux文件系统管理
  Linux文件系统：ext2，ext3，ext4，xfs，btrfs，reiserfs，jfs，swap
    swap：交互分区
    光盘：iso9660
  Windows：fat32，ntfs
  Unix：FFS，UFS，JFS2
  网络文件系统：NFS，CIFS
  集群文件系统：GFS2，OCFS2
  分布式文件系统：ceph，moosefs，mogilefs，GlusterFS,Lustre
  
  根据是否支持“journal”功能：
    日志型文件系统：ext3，ext4，xfs，...
    非日志型文件系统：ext2，vfat
  
  文件系统的组成部分：
    内核中的模块：ext4，xfs，vfat
    用户空间的管理工具：mkfs.ext4,mkfs.xfs,mkfs.vfat
  cat /proc/filesystems
  lsmod
  
  Linux的虚拟文件系统：VFS
  
  创建文件系统：
    mkfs.FS_TYPE /dev/DEVICE
    mkfs -t FS_TYPE /dev/DEVICE
      -L 'LABEL'：设定卷标
    mke2fs：ext系列文件系统专业管理工具
      -t {ext2|ext3|ext4}
      -b {1024|2048|4096}
      -L 'LABEL'
      -i n(为数据空间中每多少个字节创建一个inode，此大小不应该小于block的大小)
      -N n(为数据空间创建多少个inode)
      -m n(为管理员预留的空间占据的百分比)
    mkswap：创建交换分区
    超级块
      备份，分组(每组块数相同)
    tune2fs
    dumpe2fs -h(查看超级块信息)
      
第8天
  挂载点下原有文件在挂载完成后会被临时隐藏。建议挂载在空目录下
  进程正在使用中的设备无法被卸载
  mount
  umount
  查看内核追踪到的已挂载的所有设备：cat /proc/mounts
  查看正在访问指定文件系统的进程：
    fuser -v MOUNT_POINT
  终止所有正在访问指定文件系统的进程：
    fuser -km MOUNT_POINNT
  启用交换分区：swapon
  禁用交换分区：swqpoff 
  
1. 文件挂载的配置文件：/etc/fstab
  每行定义一个要挂载的文件系统：
    要挂载的设备或伪文件系统：
      要挂载的设备或伪文件系统    挂载点    文件系统类型    挂载选项    转储频率    自检次序
        要挂载的设备或伪文件系统
          设备文件、LABEL(LABEL="")、UUID(UUID="")、伪文件系统(proc,sysfs)
        挂载选项
          defaults
        转储频率：
          0：不做备份
          1：每天转储
          2：每隔一天转储
        自检次序：
          0：不自检
          1：首先自检，一般只有rootfs才有

2. 文件系统上的其他概念
  Inode:Index Node/索引节点
    地址指针：
      直接指针
      间接指针
      三级指针
  
  硬链接：
    指向同一inode
    不能对目录创建硬链接
    不能跨分区
    ln SRC DEST
  软链接：
    inode不同，一个指向数据文件，另一个指向文件路径
    可对目录创建软链接
    可跨分区
    ln -s SRC DEST

3. RAID
  提高IO能力、提高耐用性
  RAID实现方式：
    外接式磁盘阵列：通过扩展卡提供适配能力
    内接式RAID：主板集成RAID控制器
    Software RAID
   
  RAID级别：
    RAID-0：条带卷
    RAID-1：镜像卷
    ..
    RAID-5
    RAID-6
    RAID10
    RAID01
    
    RAID-0:
      读写性能提升
      可用空间：N*min(S1,S2,...)
      无容错能力
      磁盘数：至少2
    RAID-1：
      读性能提升、写性能略有下降
      可用空间：1*min(S1,S2,...)
      有冗余能力
      磁盘数：一般2
    RAID-5：
      读写性能提升
      可用空间：(N-1)*min(s1,s2,...)
      有容错能力：只能坏1块磁盘
      磁盘数：最少3块
    RAID-6：
      读写性能提升
      可用空间：(N-2)*min(s1,s2,...)
      有容错能力：最多坏2块磁盘
      磁盘数：最少4块
    RAID-10：
      读写性能提升
      可用空间：N*min(s1,s2...)/2
      有容错能力：每组镜像最多只能坏1块
      最少磁盘数：4
    
4. LVM
  /dev/mapper/VG_NAME-LV_NAME
    /dev/mapper/vol0-root 
    /dev/VG_NAME/LV_NAME  
(参考青鸟笔记)    
...
...
...   
5. dd命令
  用法：
    dd if=/PATH/FROM/SRC of=/PATH/TO/DEST
      bs=n：block size ,复制单元大小
      count=n：复制多少个bs
    磁盘拷贝：
      dd if=/dev/sda of=/dev/sdb
    备份MBR：
      dd if=/dev/sda of=/tmp/mbr.bak bs=512 count=1
 
### 第九天 btrfs文件系统管理与应用(01)_recv  未看
1. for 
  列表生成方式：
    1)直接给出列表
    2)整数列表
      {start..end}
      $(seq [start [step]] end)
    3)返回列表的命令
      $(COMMAND)
    4)glob  示例：/etc/*
   
2. Linux 程序包管理
  API：Application Programming Interface
    POSIX：Protable OS
   程序源代码 --> 预处理 --> 编译 --> 汇编 --> 链接
     静态编译
     共享编译
  ABI：Application Binary Interface
    库级别的虚拟化：
      Linux：WINE
      Windows：Cywin
  系统级开发
  应用级开发
  
  二进制应用程序的组成部分：
    二进制文件、库文件、配置文件、帮助文件
  
    程序包管理器：
      debian：deb(包后缀)，dpt(包管理器)
      redhat：rpm(包后缀)，rpm(包管理器)
      
  源代码：name-VERSION.tar.gz
    VERSION:major.minor.release
  rpm包命名方式：
    name-VERSION-ARCH.rpm
      VERSION：major.minor.release(程序包号)
      ARCH：release(rpm包号).arch
        常见arch：
          x86：i386,i486,i586,i686
          x86_64：x64,x86_64,adm64
          powerpc：ppc
          跟平台无关：noarch
          
    拆包：主包(常用功能)、支包(不常用功能)
    包之间：存在依赖关系
      yum：rpm包管理器的前端工具
      zypper：suse上的rpm前端管理工具，yast(图形管理工具)
      dnf：Fedora(22+) rpm包管理器的前端工具
      apt-get：deb包管理器前端工具
      
      ldd /path/to/BINARY_FILE：查看二进制程序所依赖的库文件
      管理及查看本机装载的库文件：
        ldconfig
          /sbin/ldconfig -p：显示本机已缓存的所有可用库文件名及文件路径映射关系
          配置文件为：/etc/ld.so.conf,/etc/ld.so.confd/*.conf
          缓存文件：/etc/ld.so.cache
  
  程序包管理：
    功能：将编译好的应用程序的各组成文件打包一个或几个程序包文件，从而方便快捷地实现程序包的安装、卸载、查询、升级和校验等管理操作
    1)程序的组成清(每个包独有)
      文件清单
      安装或卸载时运行的脚本
    2)数据库(公共)
      程序包名称及版本
      依赖关系
      功能说明
      安装生成的各文件的文件路径及校验码信息
   
  管理程序包的方式：
    使用包管理器：rpm
    使用前端工具：yum,dnf
  
  获取程序包的途径：
    1)系统发行版的光盘或官方的服务器
      CentOS镜像：
        http://mirrors.aliyun.com
        http://mirrosr.sohu.com
        http://mirrors.163.com
    2)项目官方
    3)第三方组织
      Fedora-EPEL
      http://pkgs.org
      http://rpmfind.net
      http://rpm.pbone.net
    4)自己制作
    
  CentOS系统上rpm命令管理程序包
    安装、卸载、升级、查询、校验、数据库维护
    安装：
      rpm -ivh package_file
        [install-options]
          --test：测试安装
          --nodeps：忽略依赖关系
          --replacepkgs：重新安装
          --nosignature：不检查来源合法性
          --nodigest：不检查包完整性
          --noscripts：不执行程序包脚本片段
            %pre：安装前脚本     --nopre
            %post：安装后脚本    --nopost
            %preun：卸载前脚本   --nopreun
            %postun：卸载后脚本  --nopostun
    升级：
      upgrage：安装有旧版程序包，则升级；若无旧版，则安装
      freeshen：安装有旧版程序包，则升级，若无旧版，则不执行升级操作
      rpm -Uvh
      rpm -Fvh
      
      --oldpackage：降级
    查询：
      rpm {-q|--query} [select-options] [query-options]
      [select-options]
        -a：所有包
        -f：查看指定文件由哪个程序包安装生成
        -p：/path/to/package_file 对尚未安装的程序包文件做查询操作
        
      [query-options]
        --changelog：查看rpm包的changlog
        -c：查询程序的配置文件
        -d：查询程序的文档
        -i：information
        -l：查看指定的程序包安装后生成的所有文件
        --scripts：查看程序包自带脚本片段
        -R：查询指定的程序包所依赖的CAPABILITY
    卸载：
      -e
      --nodeps：忽略依赖关系
       

3. yum安装        
  创建本地yum仓库
    createrepo [options] <directory>
  
  程序包编译安装：
    gcc-VERSION-release.src.rpm--> 安装后，使用rpmbuild命令制作成二进制格式的rpm包，而后再安装
    
  编译安装3步骤
    ./configure:
      1)通过选项传递参数，指定启用特性、安装路径等：执行时会参考用户的指定以及makefile.in文件生成makefile
      2)检查依赖到的外部环境
    make：
      根据makefile文件，构建应用程序
    make install
    
  开发工具：
    autoconf :生成configure脚本
    automake :生成makefile.in
    
  开源程序源代码的获取：
    官方自建站点
    代码托管：
      SourceForge
      GitHub.com
      code.google.com
  
  configure:
    --hlep:获取其支持使用的选项
      选项分类:
        安装路径设定：
          --prefix=/path/to/directory：指定默认安装位置
          --sysconfdir=/path/to/directory：配置文件安装位置
        optional Features：可选特性
          --disable-FEATURE
          --enable-FEATURE
        Optional Packages：可选包
          --with-PACKGAE
          --without-PACKAGE
  安装后的配置：
    1)导出二进制程序目录至PATH环境变量中：
      编辑文件/etc/profile.d/NAME.sh
        export PATH=/PATH/TO/BIN:$PATH
        source /etc/profile.d/NAME.sh
    2)导出库文件路径
      编辑/etc/ld.so.conf.d/NAME.conf
        添加新的库文件所在目录至此文件中
        让系统重新生成缓存：
          ldconfig [-v]
    3)导出头文件
      ln -sv 
    4)导出帮助手册
      vim /etc/man.confg文件
        添加一个MANPATH
        
第11天 网路基础知识
11.1  网桥(MAC表(根据源地址学习)，连接2个网络，单个接口连接一个网络(一个网络有多台设备))
  -->交换机
  -->路由器(路由表) 

  11.1.1> 网络协议：IP
  IP协议
    IPv4地址分类：(总共32位)
      A类：
        网络数：126个,127为回环地址
        每个网络的主机数：2^24-2
        默认子网掩码：255.0.0.0
        私网地址：10.0.0.0/8
      B类：
        网络数：2^14个
        每个网络中的主机数：2^16-2
        默认子网掩码：255.255.0.0
        私网地址：172.16.0.0/16-172.31.0.0/16
      C类：
        网络数：2^21个
        每个网络中的主机数：2^8-2
        默认子网掩码：255.255.255.0
        私网地址：192.168.0.0/24-192.168.255.0/24
      D类：组播
      E类
  
  跨网络通信：路由
    主机路由
    网络路由
    默认路由
    
  11.1.2> 将Linux主机接入到网络中：
    IP/mask
    路由：默认网关
    DNS服务器
    主机名(在DNS在注册才能被访问)   
  配置方式：
    静态指定：
      ifcfg：ifconfig，route
      ip
      直接编辑配置文件(永久有效)
    动态分配：DHCP
  配置网络接口：
    1)接口命名方式：
      Centos 6：
        以太网：eth[0,1,2...]，根据mac来决定数值
      Centos 7：
        根据槽接口来命名
    2)route（本机地址：172.16.228.95）：
      添加主机路由（子网掩码默认为255.255.255.255）：
        目标地址：192.168.1.3 网关：172.16.0.1
        route add -host 192.168.1.3 gw 172.16.0.1 dev eth0
      添加网络路由：
        目标地址：192.168.0.0 网关：172.16.0.1
        route add -net 192.168.0.0 netmask 255.255.255.0 gw 172.16.0.1 dev eth0
        route add -net 192.168.0.0/24 gw 172.16.0.1 dev eth0
      添加默认路由：
        网关：172.16.0.1
        route add -net 0.0.0.0 netmask 0.0.0.0 gw 172.16.0.1 dev eth0 
        route add default gw 172.16.0.1
    3)ip：
      ip命令及配置文件方式配置网络属性(03)_recv -->省略<--
      
    4)ss:
      网络状态查看工具，类似netstat
      ss [options] [ FILTER ]
        -t：tcp协议相关
        -u：udp协议相关
        -w：裸套接字相关
        -x：unix sock相关
        -l：listen状态连接
        -a：所有
        -n：数字格式
        -p：进程号
        -e：扩展信息
        -m：内存用量
        -o：计时器信息
        FILTER := [ state TCP-STAT ] [ EXPRESSION ]
        
      tcp 的常见状态：
        LISTEN：监听，等待别人访问的服务状态
        ESTABLISHED：已建立的连接，正在通信
        FIN_WAIT_1
        FIN_WAIT_2
        SYN_SENT
        SYN_RECV
        CLOSED
    -->centos网络属性配置(04)_recv<-- Centos7  

12. Linux 进程和作业管理
  内核的功用：进程管理、文件系统、网络功能、内存管理、驱动程序、安全功能
  12.1 pstree
    显示进程树
  
  12.2 ps
    进程状态查看
    Linux 系统各进程的相关信息均保存在 /proc/PID 目录下各文件中
    显示结果的 COMMAND 列中带有 [] 说明此进程是内核线程
    STAT：进程状态
      R：运行
      S：可中断睡眠
      D：不可中断睡眠
      T：停止态
      Z：僵尸进程
      +：前台进程
      l：多线程进程
      N：低优先级进程
      <：高优先级进程
      s：session leader(session leader进程终止，其下的进程都会被终止) 
    u：以用户为中心组织进程状态显示
    a：与终端相关的进程
    x：与终端无关的进程
    e：所有进程，相当于a、x
    f：显示完整格式的程序信息
    
   











第20天 openssh、套接字及httpd
20.1 openssh
  openssh：ssh协议的开源实现
  dropbear：ssh协议的另一个开源实现
  ssh协议监听端口：22/tcp
  telnet协议监听端口：23/tcp