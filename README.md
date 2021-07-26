# Deploy a list of Azure Service Principals and Assignment them to a Scope / Role

This repository will create a list of service principals and make them to a `scope` and `role_definition`.

You will need a create a `variables.tfvars` (or modify the example in the examples directory) file and set the __spn_list variable__ for the deployment:
-  `spn_list`
    - Example:
        ```json
            spn_list = {
                "Connectivity_SPN" = {
                    display_name         = "Connectivity_SPN"
                    scope                = "/subscriptions/*******************"
                    role_definition_name = "Owner"
                },
                "Landing_Zone_SPN" = {
                    display_name         = "Landing_Zone_SPN"
                    scope                = "/subscriptions/*******************"
                    role_definition_name = "Owner"
                }
            }
        ```
## Testing
Run the following commands to test the Terraform example:
```bash
az login

terraform init 
terraform apply -input=false -auto-approve -var-file="variables.tfvars"
```