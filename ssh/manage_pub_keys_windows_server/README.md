## ssh/manage_pub_keys_windows_server

Jobs for add and remove ssh public keys **(NON ADM USERS ONLY)** into a Windows machine with OpenSSH server installed. 

For these jobs to work properly Jenkins must have ssh access to the Windows machine.

Follow the steps on [This tutorial](https://www.concurrency.com/blog/may-2019/key-based-authentication-for-openssh-on-windows) for configuring your Windows machine properly

Jenkins must have admin access to the machine

At least one non-adm user must be created on the windows machine

You must set the following in Jenkins:

* Jenkins ssh key pair must be set with 'win-server-ssh-key' credential id (or replace it in the sshagent plugin on code)

* Environment variables needed (can be set globally): 
    * EMAIL_DOMAIN (mandatoy email domain id on ssh key i.g.: '@email.com')
    * WIN_ADM_USERNAME (windows server admin user)
    * WIN_REGULAR_USERNAME (windows server regular user)
    * WIN_SERVER_ADDRESS (windows server address)