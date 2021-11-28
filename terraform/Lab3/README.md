

```
terraform workspace new dev
terraform workspace show
terraform workspace new prod
terraform workspace list
terraform workspace select dev
  count = (terraform.workspace == "prod" ? 3 : 1)
  tags = {
    Name = "${terraform.workspace}-node01"
  }
}
```


Maybe mention that workspaces is just part of the solution.. should be using modules and configuriaton.


Non-default workspaces are often related to feature branches in version control. The default workspace might correspond to the "main" or "trunk" branch, which describes the intended state of production infrastructure. When a feature branch is created to develop a change, the developer of that feature might create a corresponding workspace and deploy into it a temporary "copy" of the main infrastructure so that changes can be tested without affecting the production infrastructure. Once the change is merged and deployed to the default workspace, the test infrastructure can be destroyed and the temporary workspace deleted.

When Terraform is used to manage larger systems, teams should use multiple separate Terraform configurations that correspond with suitable architectural boundaries within the system so that different components can be managed separately and, if appropriate, by distinct teams. Workspaces alone are not a suitable tool for system decomposition, because each subsystem should have its own separate configuration and backend, and will thus have its own distinct set of workspaces.

In particular, organizations commonly want to create a strong separation between multiple deployments of the same infrastructure serving different development stages (e.g. staging vs. production) or different internal teams. In this case, the backend used for each deployment often belongs to that deployment, with different credentials and access controls. Named workspaces are not a suitable isolation mechanism for this scenario.

Instead, use one or more re-usable modules to represent the common elements, and then represent each instance as a separate configuration that instantiates those common elements in the context of a different backend. In that case, the root module of each configuration will consist only of a backend configuration and a small number of module blocks whose arguments describe any small differences between the deployments.