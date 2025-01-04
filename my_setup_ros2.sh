# copy and paste in ~/.bashrc or ~/.zshrc
# source ~/ros_setup/my_setup_ros2.sh zsh
# source ~/ros_setup/my_setup_ros2.sh bash

export PATH=/usr/local/bin:$PATH

if [ -z "$WS" ]; then
	export WS="ros2_ws"
fi

shell=$1

alias rosargcomp='eval "$(register-python-argcomplete3 ros2)" && eval "$(register-python-argcomplete3 colcon)"'

source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.$shell

source /opt/ros/humble/setup.$shell

source ~/$WS/install/setup.$shell

if [[ $1 == 'bash' ]]; then
	alias sb='source ~/.bashrc'
	alias cbs='rd && colcon build --symlink-install && sb'
	alias cb='rd && colcon build && sb'
elif [[ $1 == 'zsh' ]]; then
	alias sz='source ~/.zshrc'
	alias cbs='rd && colcon build --symlink-install && sz'
	alias cb='rd && colcon build && sz'
fi

rosargcomp

alias python=python3
alias py=python3
alias snb='sudo nano ~/.bashrc'
alias snz='sudo nano ~/.zshrc'
alias rd='cd ~/$WS'
alias rds='cd ~/$WS/src'
alias drd='rd && sudo rm -rf build log install'
alias cbp='rd && colcon build --packages-select'
alias cbsp='rd && colcon build --symlink-install --packages-select'
alias ri='rd && rosdep install --from-paths src --ignore-src -y -r'
alias rr='ros2 run'
alias rl='ros2 launch'
alias rtl='ros2 topic list'
alias rnl='ros2 node list'
alias rte='ros2 topic echo'
alias rbr='ros2 bag record'
alias gsu='git submodule init && git submodule update'
alias ud='sudo apt-get update -y'
alias ug='sudo apt-get upgrade -y'
alias udg='ud && ug'

echo "ROS2 Workspace: $WS"
