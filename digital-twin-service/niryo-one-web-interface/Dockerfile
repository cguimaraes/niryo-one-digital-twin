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

USER root
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-get install -y python3 python3-pip python3-dev && \
  pip install pyassimp && \
  python3 -m pip install --upgrade multidict && \
  python3 -m pip install --upgrade typing_extensions && \
  python3 -m pip install --upgrade attrs && \
  python3 -m pip install --upgrade yarl && \
  python3 -m pip install --upgrade async_timeout && \
  python3 -m pip install --upgrade idna_ssl && \
  python3 -m pip install --upgrade aiosignal && \
  python3 -m pip install --upgrade requests && \
  python3 -m pip install --upgrade aiohttp && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER niryo
WORKDIR /home/niryo
RUN mkdir -p scripts
COPY files/scripts/* scripts/
COPY files/web_interface/* .

WORKDIR /home/niryo/

CMD bash -c "source /opt/ros/melodic/setup.bash && ./scripts/wait-for-ros-nodes.sh"
 
