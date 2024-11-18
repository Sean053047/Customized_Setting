FROM ros:iron

# Source ROS 2 setup script
SHELL ["/bin/bash", "-c"]

# Set entrypoint to source ROS 2 Iron
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/iron/setup.bash && exec bash"]

# RUN apt-get update
RUN apt-get update && \
    apt-get install -y tmux vim wget git curl htop nvtop gpg pip

RUN mkdir -p /setup

COPY *.sh /setup/

RUN bash /setup/install_tools_docker.sh --git_user Sean053047 --git_email sadlamb910803@gmail.com && \
    bash /setup/install_venv_related.sh


# 
# RUN chomod +x /setup/*.sh




# RUN useradd -s /bin/bash eva_sean
# USER eva_sean




# RUN bash /setup/install_venv_related.sh


