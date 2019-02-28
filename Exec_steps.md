    

##  Step by step procedure in performing the activities and how to execute the code.


## Task1

# Execute these steps from any operating system which is already installed terraform.

Steps:

    1. To initialize a working directory

        $  terraform init

    2. validate the syntax of the terraform files

        $ terraform validate <Pathofthecode> -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>"

    3. To create/apply the changes required to reach the desired state of the configuration

        $   terraform apply <Pathofthecode> -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>"

    4.  To destroy the Infrastructure before applied configuration

        $   terraform destroy <Pathofthecode> -var "accesskey=<accesskeycode>" -var "secretkey=<secretkeycode>"

            

### Task2


# ANSIBLE Configuration:
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
            ansible (ALL:ALL) NOPASSWD: ALL
        
    4. Change PasswordAuthentication no to yes

        $ sudo /etc/ssh/sshd_config
           PasswordAuthentication yes

    5. Create own hosts file 

        $ sudo vi hosts
            [WebServer]
            localhost
    
    6. Generate  ssh key 

        $ ssh-keygen

    7. Copy the key

        $ ssh-copy-id ansible@<serverip/nodeip/localhost>

    8. Check the Server and Nodes are pinging are not

        $ ansible -m ping all 

# Execute the ansible playbook

step:

    1. Execute the ansible playbook

        $ ansible-playbook -i <hostsfilepath> <playbookpath>

    
    Check all packages versions

### Task3

Login to MSR-test-Instance-1 using .pem(terrafom)  

steps:

    1.  Execute the ansible playbook

        $ ansible-playbook -i <hostsfilepath> <playbookpath>

    2. Open browser 

        url: http://<pubip>:sample.html

### Task4

Login to MSR-test-Instance-2 using .pem(terrafom)  

steps:

    1.  Execute the ansible playbook

        $ ansible-playbook -i <hostsfilepath> <playbookpath>

    2. Configure the proxy 

        Open /etc/couchdb/local.ini file and change the below things

            [httpd]
            ;port = 5984
            ;bind_address = 127.0.0.1

            to 

            [httpd]
            port = 5984
            bind_address = 0.0.0.0

    3.  Restart the CouchDB Database

        $ sudo service couchdb restert

    4.  Open Browser 

        url: html://<pubip>:5984/_utils/index.html




























































