FROM ros:melodic
MAINTAINER mgroshev@pa.uc3m.es

WORKDIR /root
RUN useradd -ms /bin/bash niryo

RUN \
  apt-get update && \
  apt-get install -y lsof && \
  apt-get install -y python-rosinstall python-rosinstall-generator && \
  apt-get install -y python-wstool build-essential python-pip xauth && \
  apt-get install -y ros-melodic-robot-state-publisher \
    ros-melodic-moveit ros-melodic-rosbridge-suite ros-melodic-joy \
    ros-melodic-ros-control ros-melodic-ros-controllers \
    ros-melodic-tf2-web-republisher ros-melodic-joint-state-publisher-gui &&\
  pip install jsonpickle && \
  rm -rf /var/lib/apt/lists/*

USER niryo
WORKDIR /home/niryo

RUN rosdep update && \
    mkdir -p catkin_ws/src && cd catkin_ws/src && \
    git clone https://github.com/NiryoRobotics/niryo_one_ros.git .

RUN cd catkin_ws && bash -c "source /opt/ros/melodic/setup.bash && catkin_make"

COPY files/launch/* catkin_ws/src/niryo_one_bringup/launch/

CMD bash -c "source /opt/ros/melodic/setup.bash && source catkin_ws/devel/setup.bash && roslaunch niryo_one_bringup sim_robot_drivers.launch --wait"
