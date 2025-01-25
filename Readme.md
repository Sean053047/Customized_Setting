# Build Docker  

```bash  
cd ${Customized_setting directory}

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg UNAME=eva_sean -f Customized_Setting/ros_Dockerfile -t ub .
```


follow the steps to build the customized settings:

1. cd {path of settings}
2. sudo chmod +x ./*.sh 
3. ./install_fonts.sh
4. ./install_tools.sh
4. ./install_apps.sh
5. ./install_gnome_theme.sh
