 ASSIGNMENT
 ----------


I used infrastructure automation tools are Terraform and Ansible 


############        Task 01         #############
-------------------------------------------------

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
    
# Execute these steps from any operating system which is already installed terraform.

Steps:

    1. To initialize a working directory

        $  terraform init

    2. validate the syntax of the terraform files

        $ terraform validate -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>" <Pathofthecode> 

    3. To create/apply the changes required to reach the desired state of the configuration

        $   terraform apply -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>" <Pathofthecode>


![terraform_yes](https://user-images.githubusercontent.com/48052747/53615192-d43ed700-3c02-11e9-8dfd-c8938617a609.JPG)
	
![terraform_output](https://user-images.githubusercontent.com/43407156/53615376-99896e80-3c03-11e9-96c7-2caa00ce73c6.JPG)

In AWS Cloud the machines are started


![terraform_machine](https://user-images.githubusercontent.com/43407156/53615463-f8e77e80-3c03-11e9-8bd4-d096659a6f8f.JPG)

    4.  To destroy the Infrastructure before applied configuration

        $   terraform destroy -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>" <Pathofthecode>   

## Explanation and Documentation:
   ------------------------------

  Here, I'm using terraform script. 

=> Provider -> AWS

    -> Here, create two variables for accesskey and secretkey for security.

    -> We call these two variable at runtime(execution)

    -> Using .pem(i used terraform.pem) file we provide credentials for login two machines

    -> Used t2.micro as instance type 
    
### Code : from test1/main.tf       
-------------
############        Task 02         #############       
-------------------------------------------------

## Ansible:

Ansible is a radically simple IT automation system. It handles configuration management, application deployment, cloud provisioning, ad-hoc task-execution, and multinode orchestration. Including zero-downtime rolling updates with load balancers.

## Configure Both machines: 
-----------------------

-> Create a user(ansible) using "adduser ansible"

-> Add this user in "visudo" file and add "ansible (ALL:ALL) NOPASSWD: ALL".

-> Execute "sudo vi /etc/ssh/sshd_config" for changing "PasswordAuthentication" as yes.

-> Open inventory file, add serverip/localhost and all nodes DNS to defeentiate with host names like [<hostname>]

-> We can create our own(not default) inventory file with localhost

-> ssh-keygen tool is used to generate private/public key pair for ssh. By default, tool generates the private(id_rsa) and public(id_rsa.pub) keys in ~/.ssh/ directory. These key pairs are used for password-less login, Single sign On and hosts authentication.
    
	$ ssh-keygen 

-> Copy the ssh-copy-id to self and node machines
    
	$ ssh-copy-id ansible@localhost

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

-> Login into the both Provisioned instances using .pem keypair

-> Copy the code from any storage to the two machines

## Explanation and Documentation:
   ------------------------------

->  Install git for VCS (Version Control System) is a Distributed version control tool is used to store different versions of a file in local or remote repository. 

->  Git is to track changes in the source code, allows multiple developers to work together.

->  Openssl is widely used in Internet web servers, serving all websites.

->  Docker is to create, deploy and run applications by using containers. Docker creates custom images to  writting Dockerfile.

-> Docker-compose is for defining and running multi-container Docker appliations. Use YAML file to configure application's services.

->  Node.js is a platform built on chrome's JavaScript runtime for building fast, scalable network applicaitons.

-> NVM stands for Node Version Manager. It can manage and switch between diff Node versions with easily. and we can install diff versions with a single command.

## ANSIBLE Configuration:
---------------------
step:

    1. Login to Both machines

        $ ssh -i <.pemfile> ubuntu@<DNS/IP>

    2. Add a user 
        
        $ adduser ansible

          enter password 
          re-enter password
    
    3. Add ansible user into visudo file

        $ sudo visudo

            %sudo 
            ansible ALL=(ALL:ALL) NOPASSWD: ALL
        
    4. Change PasswordAuthentication no to yes

        $ sudo vi /etc/ssh/sshd_config
           PasswordAuthentication yes
	
		Restart ssh service
		
		$ sudo systemctl restart sshd
		
	5. Login to ansible user 
	
		$ su ansible
			
			Password: ansible123
		
    6. Create own hosts file 

        $ sudo vi hosts
            [WebServer]
            localhost
			[all]
			localhost
    
    7. Generate  ssh key 

        $ ssh-keygen

    8. Copy the key

        $ ssh-copy-id ansible@localhost

	9. Install ansible packages
	
		$ sudo apt-get install ansible -y

    10. Check the Server and Nodes are pinging are not

        $ ansible -i hosts -m ping all 
		
![ping](https://user-images.githubusercontent.com/43407156/53619741-70bea480-3c16-11e9-8da2-97adb5ff5bc2.JPG)

# Execute the ansible playbook


step:

	1. Login with ansible user
	
		$ ssh ansible@52.70.109.198
			
			password: ansible123

    2. Execute the ansible playbook

        $ ansible-playbook -i hosts Packages.yml

![playbook_exec](https://user-images.githubusercontent.com/43407156/53620330-8fbe3600-3c18-11e9-9429-baf2691dae99.JPG)
    
	3. Exit terminal and relogin because of nvm tool will affect 
	
		Perform steps 2 again
	
    Check all packages versions
	
![version_check](https://user-images.githubusercontent.com/43407156/53620852-73bb9400-3c1a-11e9-8604-3fd08499e245.JPG)
	
### Code :  test2/Packages.yml file
------------- 
 ############        Task 03         #############     
--------------------------------------------------
=> Using configuration management tool(Ansible) to automate the entire installation of apache and deploy a sample html file from a GitHub repository.

Github
------

-> Created a github free tier account 

-> Created a public repository (assignment) 

-> Written a sample.html file and added to local repository using
        
		$ git add .
        
		$ git commit -m "first commit"
    
-> Add the local repository to remote by using "git remote add origin <https:repositoryname>"

-> Push the changes using " git push -u origin master"

![sample_html_github](https://user-images.githubusercontent.com/43407156/53629243-1a139380-3c33-11e9-995f-d8b78d899dd6.JPG)

-> Here this sample.html raw url used in the "get_url" module.

-> Finally deployed the sample.html on apache web server using ansible playbook.

-> Login to MSR-test-Instance-1 using ansible user credentials

-> Execute the ansible-playbook -i hosts apache.yml

-> Open any browser http://52.23.109.53:sample.html

-> Opened the content inside the sample.html

## Login to MSR-test-Instance-1 using password

	$ ssh ansible@52.23.109.53
	
		Password: ansible123

steps:

    1.  Execute the ansible playbook

        $ ansible-playbook -i hosts apache.yml

![sample_html_github](https://user-images.githubusercontent.com/43407156/53630180-7c6d9380-3c35-11e9-8cae-9f48c05e231b.JPG)

    2. Open browser 

        url: http://52.23.109.53:sample.html

![browse_sample_file](https://user-images.githubusercontent.com/43407156/53630209-914a2700-3c35-11e9-9ed2-eecbf15ced1b.JPG)

### Code :  test3/apache.yml file
-------
############        Task 04         #############     
-------------------------------------------------

=> Using configuration management tool(Ansible) to automate the entire installation of CouchDB Database.

-> Login to MSR-test-Instance-2 using ansible user credentials

	$ ssh ansible@52.70.109.198
	
		Password: ansible123


-> After Installation using 

	$ ansible-playbook -i hosts apache_CouchDB.yml 

-> If we want to access the Futon-web GUI want configure

Configuration:
--------------

-> Open /opt/couchdb/etc/local.ini file and change the below things

			[chttpd]
            ;port = 5984
            ;bind_address = 127.0.0.1

            to 

            [chttpd]
            port = 5984
            bind_address = 0.0.0.0
			
-> Restart the CouchDB Database

-> Check with curl http://52.70.109.198:5984/ and its output is

    {"couchdb":"Welcome","uuid":"<someid>","version":"1.6.0","vendor":{"version":"15.10","name":"Ubuntu"}}

        if not check again

-> CouchDB Database runs on 5984 port number

->  Open any Browser enter url 

        http://52.70.109.198:5984/_utils

-----

# Login to MSR-test-Instance-2 using ansible user credentials
	

steps:

    1.  Execute the ansible playbook

        $ ansible-playbook -i hosts apache_CouchDB.yml

![palybook_exec](https://user-images.githubusercontent.com/43407156/53637505-5520c180-3c49-11e9-8d66-8422d89f81db.JPG)

    2. Configure the proxy 

        Open /opt/couchdb/etc/local.ini file and change the below things

            [chttpd]
            ;port = 5984
            ;bind_address = 127.0.0.1

            To 

            [chttpd]
            port = 5984
            bind_address = 0.0.0.0

![proxy](https://user-images.githubusercontent.com/43407156/53637550-75e91700-3c49-11e9-9846-69f0b294d261.JPG)


    3.  Restart the CouchDB Database

        $ sudo service couchdb restert

    4.  Open Browser 

        url: html://52.70.109.198:5984/_utils

![browse_futon](https://user-images.githubusercontent.com/43407156/53637583-8f8a5e80-3c49-11e9-87ee-6c42f6dab8ba.JPG)

### Code :  test4/apache_CouchDB.yml file
