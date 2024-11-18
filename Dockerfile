FROM ros:iron

# Source ROS 2 setup script
SHELL ["/bin/bash", "-c"]

# Set entrypoint to source ROS 2 Iron
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/iron/setup.bash && exec bash"]

RUN mkdir -p /setup
COPY *.sh /setup/
# RUN chomod +x /setup/*.sh


RUN useradd -s /bin/bash eva_sean
USER eva_sean


# RUN bash /setup/install_venv_related.sh

# RUN bash /setting/install_tools.sh && \
    # bash /setting/install_venv_related.sh

