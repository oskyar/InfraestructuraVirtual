root@oskyar-M60Vp:/var/lib/lxc# wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
--2013-11-15 15:36:53--  http://lxc-webpanel.github.io/tools/install.sh
Resolviendo lxc-webpanel.github.io (lxc-webpanel.github.io)... 185.31.19.133
Conectando con lxc-webpanel.github.io (lxc-webpanel.github.io)[185.31.19.133]:80... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 2648 (2,6K) [application/octet-stream]
Grabando a: “STDOUT”

 0% [                                                                                                       ] 0           --.-K/s               _     __   _______  __          __  _       _____                 _ 
| |    \ \ / / ____| \ \        / / | |     |  __ \               | |
| |     \ V / |       \ \  /\  / /__| |__   | |__) |_ _ _ __   ___| |
| |      > <| |        \ \/  \/ / _ \ '_ \  |  ___/ _` | '_ \ / _ \ |
| |____ / . \ |____     \  /\  /  __/ |_) | | |  | (_| | | | |  __/ |
|______/_/ \_\_____|     \/  \/ \___|_.__/  |_|   \__,_|_| |_|\___|_|


Automatic installer

Installing requirement...
100%[======================================================================================================>] 2.648       --.-K/s   en 0,03s   

2013-11-15 15:36:57 (78,4 KB/s) - escritos a stdout [2648/2648]

Cloning LXC Web Panel...
Clonar en «/srv/lwp»...
remote: Counting objects: 93, done.
remote: Compressing objects: 100% (78/78), done.
remote: Total 93 (delta 33), reused 62 (delta 12)
Unpacking objects: 100% (93/93), done.
Checking connectivity... done

Installation complete!


Adding /etc/init.d/lwp...
Done
Starting server.../usr/bin/python already running.
done.
Connect you on http://your-ip-address:5000/
