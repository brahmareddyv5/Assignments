 ASSIGNMENT
 ----------


I used infrastructure automation tools are Terraform and Ansible 


############        Task 01         #############
-------

## Terraform:
-------------
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.


# Create two EC2 Instances in AWS Cloud using,

  Additional Information
  ----------------------

-> Instance Type of both instance is t2.micro.
-> Operating System for both instances Ubuntu Server 16.04 LTS.
-> Hostname of Instance 1 : MSR-test-Instance-1.
-> Hostname of Instance 2 : MSR-test-Instance-2.
    
    
# Code : from test1/main.tf

## Explanation and Documentation:
   ------------------------------

  Here, I'm using terraform script. 

=> Provider -> AWS
    Here, create two variables for accesskey and secretkey for security.
	We call these two variable at runtime(execution)
    Using .pem(i used terraform.pem) file we provide credentials for login two machines
    Used t2.micro as instance type 
    
       

############        Task 02         #############       

## Ansible:
   --------
Ansible is a radically simple IT automation system. It handles configuration management, application deployment, cloud provisioning, ad-hoc task-execution, and multinode orchestration. Including zero-downtime rolling updates with load balancers.

# Configure Both machines: 
-----------------------

-> Create a user(ansible) using "adduser ansible"

-> Add this user in "visudo" file and add "ansible (ALL:ALL) NOPASSWD: ALL".

-> Execute "sudo vi /etc/ssh/sshd_config" for changing "PasswordAuthentication" as yes.

-> Open inventory file, add serverip/localhost and all nodes DNS to defeentiate with host names like [<hostname>]

-> We can create our own(not default) inventory file with localhost

-> ssh-keygen tool is used to generate private/public key pair for ssh. By default, tool generates the private(id_rsa) and public(id_rsa.pub) keys in ~/.ssh/ directory. These key pairs are used for password-less login, Single sign On and hosts authentication.
    $ ssh-keygen 

-> Copy the ssh-copy-id to self and node machines
    $ ssh-copy-id ansible@<serverip/nodeip>

-> Check server and all Nodes pinging are not 
        $ ansible -m ping all
    o/p: success
------

# The following software packages are installed using configuration management tool ansible for provisioned instances.

•	NVM – Version 0.33.2
•	Node – 8.12.0
•	Docker – 18.06 or latest
•	Docker Compose – 1.13 or latest
•	Openssl – latest version
•	Git – latest version

Login into the both Provisioned instances using .pem keypair

Copy the code from any storage to the two machines

# Code :  test2/Packages.yml file

## Explanation and Documentation:
   ------------------------------

->  Install git for VCS (Version Control System) is a Distributed version control tool is used to store different versions of a file in local or remote repository. 
->  Git is to track changes in the source code, allows multiple developers to work together.
->  Openssl is widely used in Internet web servers, serving all websites.
->  Docker is to create, deploy and run applications by using containers. Docker creates custom images to  writting Dockerfile.
-> Docker-compose is for defining and running multi-container Docker appliations. Use YAML file to configure application's services.
->  Node.js is a platform built on chrome's JavaScript runtime for building fast, scalable network applicaitons.
-> NVM stands for Node Version Manager. It can manage and switch between diff Node versions with easily. and we can install diff versions with a single command.

############        Task 03         #############     

=> Using configuration management tool(Ansible) to automate the entire installation of apache and deploy a sample html file from a GitHub repository.

Github
------

-> Created a github free tier account 

-> Created a public repository (assignment) 

-> Written a sample.html file and added to local repository using
        $ git add .
        $ git commit -m "first commit"
    
-> Add the local repository to remote bu using "git remote add origin <https:repositoryname>"

-> Push the changes using " git push -u origin master"

-> Here this sample.html raw url used in the "get_url" module.

-> Finally deployed the sample.html on apache web server using ansible playbook.

-> Login to MSR-test-Instance-1 using .pem(terrafom)

-> Execute the ansible-playbook -i <hostsfilepath> <pathofCONFIGfile>

-> Open any browser http://<publicip>:sample.html

-> Opened the content inside the sample.html

############        Task 04         #############     

=> Using configuration management tool(Ansible) to automate the entire installation of CouchDB Database.

-> Login to MSR-test-Instance-2 using .pem(terrafom)

-> After Installation using ( ansible-playbook -i <hostsfilepath> <pathofCONFIGfile>) 

-> If we want to access the Futon-web GUI want configure

Configuration:
--------------
-> Open /etc/couchdb/local.ini file and change the below things

[httpd]
;port = 5984
;bind_address = 127.0.0.1

to 

[httpd]
port = 5984
bind_address = 0.0.0.0

-> Restart the CouchDB Database

-> Check with curl http://<pubip>:5984/ and its output is

    {"couchdb":"Welcome","uuid":"<someid>","version":"1.6.0","vendor":{"version":"15.10","name":"Ubuntu"}}
        if not check again

-> CouchDB Database runs on 5984 port number

->  Open any Browser enter url 

        http://<pubip>:5984/_utils/index.html



































