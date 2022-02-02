# Azure App Server Demo
## By Jess Hoch
### The Terraform configuration files will deploy the resources for a app server cluster in Azure.
### If you are using ACG's Azure Sandbox, you will need to import the Resource Group into your configuration using the `terraform import` command so it is in your state file in both working directories.
### You will first deploy the resource for your remote state in the `remote_state_storage directory`
### After you have done that, you will move into the `app_servers` directory and deploy the resources for you app servers.
### Remember you must use the information from the outputs of your remote state storage in you app_server backend configuration file.
### Good luck!