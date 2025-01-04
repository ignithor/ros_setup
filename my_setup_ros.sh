# copy and paste in ~/.bashrc or ~/.zshrc
# source ~/ros_setup/my_setup_ros.sh zsh
# source ~/ros_setup/my_setup_ros.sh bash

export PATH=/usr/local/bin:$PATH

if [ -z "$WS" ]; then
	export WS="ros_ws"
fi

shell=$1


source /opt/ros/noetic/setup.$shell

source ~/$WS/devel/setup.$shell

if [[ $1 == 'bash' ]]; then
	alias sb='source ~/.bashrc'
	alias cm='rd && caktin_make && sb'
elif [[ $1 == 'zsh' ]]; then
	alias sz='source ~/.zshrc'
	alias cb='rd && caktin_make && sz'
fi

alias python=python3
alias py=python3
alias snb='sudo nano ~/.bashrc'
alias snz='sudo nano ~/.zshrc'
alias rd='cd ~/$WS'
alias rds='cd ~/$WS/src'
alias rr='rosrun'
alias rl='roslaunch'
alias rtl='rostopic list'
alias rnl='rosnode list'
alias rte='rostopic echo'
alias rbr='rosbag record'
alias gsu='git submodule init && git submodule update'
alias ud='sudo apt-get update -y'
alias ug='sudo apt-get upgrade -y'
alias udg='ud && ug'

echo "ROS Workspace: $WS"
