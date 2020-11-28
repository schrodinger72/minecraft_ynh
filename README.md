# Minecraft app for YunoHost
Minecraft Server

- [Yunohost project](https://yunohost.org)
- [Minecraft website](https://www.minecraft.net/)

### Installing guide :

The app can be installed through the YunoHost **admin web-interface** or by **running the following command**:

         $ sudo yunohost app install https://git.schrodinger.ovh/cat/minecraft_ynh/
         
### Start / Stop / Restart / Check Status Minecraft :

- ```systemctl start minecraft```
- ```systemctl stop minecraft```
- ```systemctl restart minecraft```
- ```systemctl status minecraft```

### Location :

The folder of your servers is : ```/home/yunohost.minecraft/```

### Supported Servers :
 
1. Minecraft (Vanilla)
2. Spigot
3. CraftBukkit (by Spigot)
4. BungeeCord
5. Paper
 
### Upgrade this package:

        $ sudo yunohost app upgrade minecraft -u https://git.schrodinger.ovh/cat/minecraft_ynh/

