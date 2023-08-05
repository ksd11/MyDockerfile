# color
COLOR_RED='\033[1;31m'
COLOR_GREEN='\033[1;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_END='\033[0m'


success_message(){
    echo -e $COLOR_GREEN $@ $COLOR_END
}

fail_message(){
    echo -e $COLOR_RED $@ $COLOR_END
}

danger_message(){
    echo -e $COLOR_YELLOW $@ $COLOR_END
}

keep_going(){
    danger_message $1
    echo -n "Do you want to continue? [y/n]"
    read answer

    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        echo "Continuing..."
        # 继续执行脚本
    elif [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
        echo "Exiting..."
        exit 1
    else
        echo "Invalid input!"
        keep_going $1
    fi
}
