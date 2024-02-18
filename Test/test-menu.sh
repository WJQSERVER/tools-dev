#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

clear

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "脚本内出现的信息与本团队无关，脚本内的广告并非团队投放，请注意辨别"
echo "当前版本为V.0.4-BETA"

# 导入配置文件
source "repo_url.conf"

sleep 1

# 安装下载工具
apt install wget curl -y

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}

#ChatGPT解锁
function chatgpt(){
    clear
    bash <(curl -Ls https://cdn.jsdelivr.net/gh/missuo/OpenAI-Checker/openai.sh)
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#Region流媒体解锁测试
function region-media(){
    clear
    bash <(curl -L -s check.unlock.media)
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#yeahwu流媒体解锁检测
function yeahwu-media(){
    clear
    wget -qO- https://github.com/yeahwu/check/raw/main/check.sh | bash
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#backtrace三网回程线路测试
function backtrace(){
    clear    
    curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#mtr_trace三网回程线路测试
function mtrtrace(){
    clear
    curl https://raw.githubusercontent.com/zhucaidan/mtr_trace/main/mtr_trace.sh | bash
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#besttrace三网回程延迟路由测试
function besttrace(){
    clear
    wget -qO- git.io/besttrace | bash   
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#Superspeed三网测速
function superspeed(){
    clear    
    bash <(curl -Lso- https://git.io/superspeed_uxh)   
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#Hyperspeed三网测速
function hyperspeed(){
    clear
    bash <(curl -Lso- https://bench.im/hyperspeed)    
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#Lemonbench 综合测试
function lemonbench(){
    clear    
    curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast    
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#Yabs性能带宽测试
function yabsbench(){
    clear
    curl -sL yabs.sh | bash -s -- -i -5   
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#bench性能测试
function benchbench(){
    clear
    curl -Lso- bench.sh | bash
    #等待1s
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#spiritysdx融合怪测评
function spiritysdx(){
    clear
    curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
    sleep 1
    #返回菜单/退出脚本
    read -p "是否返回菜单?: [Y/n]" choice
    if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
        wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
    else
        echo "脚本结束"
    fi
}

#返回主脚本
function back(){
    wget -O main.sh ${repo_url}main.sh && chmod +x main.sh && ./main.sh
}

#主菜单
function start_menu(){
    clear
    yellow " WJQserver Studio的快捷工具箱 BETA版 "
    green " WJQserver Studio tools BETA" 
    yellow " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    yellow " =================================================="
    green " 1. ChatGPT解锁" 
    green " 2. Region流媒体解锁测试"
    green " 3. Yeahwu流媒体解锁检测"
    yellow " =================================================="    
    green " 4. Backtrace三网回程线路测试" 
    green " 5. MTR_trace三网回程线路测试"
    green " 6. Besttrace三网回程延迟路由测试"
    yellow " =================================================="
    green " 7. Superspeed三网测速"
    green " 8. Hyperspeed三网测速"
    yellow " =================================================="
    green " 9. Lemonbench综合测试"
    green " 10.Yabs性能带宽测试"
    green " 11.bench性能测试"
    green " 12.spiritysdx融合怪测评"
    yellow " =================================================="
    green " 0. 返回主脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           chatgpt
	    ;;
        2 )
	       region-media
        ;;
	    3 )
           yeahwu-media
	    ;;
        4 )
	       backtrace
        ;;
	    5 )
           mtrtrace
	    ;;
        6 )
	       besttrace
        ;;
	    7 )
           superspeed
	    ;;
	    8 )
           hyperspeed
	    ;;
	    9 )
           lemonbench
	    ;;
	    10 )
           yabsbench
	    ;;
	    11 )
           benchbench
	    ;;
	    12 )
           spiritysdx
	    ;;                                           

        0 )
           back
        ;;
	
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
