Here’s a polished and professional version of your `README.md` — structured for clarity, onboarding ease, and long-term team use. It includes deployment guidance, GitLab push/pull sync instructions, and extra best-practice tips (e.g., version pinning, workspaces, variable sets, etc.). (10/29/2025 - Everything is updated for the baseline changing to new repo)

---

````markdown
# Terraform_Baseline

## 📘 Overview
**Terraform_Baseline** provides a modular, reusable baseline for deploying infrastructure using Terraform.  
It supports a standard folder hierarchy for environment isolation (e.g., `dev`, `prod`), modular organization (e.g., `networking`, `iam`, `compute`, `storage`), and integrates seamlessly with **GitLab CI/CD pipelines** for automated provisioning, validation, and version control.

---

## 🧱 Project Structure

```bash
Terraform_Baseline/
├── README.md
├── .gitignore
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── compute/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── storage/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
└── envs/
    ├── dev/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   ├── backend.tf
    ├── prod/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── backend.tf
````

---

## 🚀 Getting Started

### 1. **Install Prerequisites**

Ensure the following tools are installed:

* [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.5+ recommended)
* [Git](https://git-scm.com/downloads)
* [GitLab CLI](https://docs.gitlab.com/ee/integration/gitlab_cli/)
* (Optional) [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) or [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

---

### 2. **Clone the Repository**

```bash
git clone https://gitlab.com/<your-org>/Terraform_Baseline.git
cd Terraform_Baseline
```

---

### 3. **Initialize Terraform**

Run the following command in your desired environment directory:

```bash
cd envs/dev
terraform init
```

This command:

* Downloads the required providers.
* Configures the remote backend (if defined in `backend.tf`).
* Prepares the environment for plan/apply operations.

---

### 4. **Plan & Apply**

Generate a plan and apply it to deploy infrastructure:

```bash
terraform plan -out=tfplan
terraform apply tfplan
```

To destroy resources:

```bash
terraform destroy
```

---

## 🧩 Using Modules

Each module in `modules/` (e.g., `networking`, `iam`, `compute`, `storage`) defines reusable components that can be called from environment configurations (`envs/dev/main.tf`, etc.).
Example usage in `envs/dev/main.tf`:

```hcl
module "networking" {
  source = "../../modules/networking"
  vpc_cidr = var.vpc_cidr
  environment = var.environment
}
```

---

## 🔄 GitLab Sync and Version Control

### **Clone & Pull Updates**

```bash
git pull origin main
```

### **Commit & Push Changes**

```bash
git add .
git commit -m "Updated networking module with new CIDR logic"
git push origin main
```

### **Branching Best Practices**

* **Feature branches:** `feature/<description>`
* **Bugfix branches:** `bugfix/<description>`
* **Environment branches:** `env/dev`, `env/prod`

> 💡 *Use GitLab Merge Requests for code review before merging into `main`.*

---

## 🧰 GitLab CI/CD Integration (Optional)

Include a `.gitlab-ci.yml` file for automation. Example pipeline stages:

```yaml
stages:
  - validate
  - plan
  - apply

validate:
  stage: validate
  script:
    - terraform init -backend=false
    - terraform validate

plan:
  stage: plan
  script:
    - terraform plan -out=tfplan
  artifacts:
    paths:
      - tfplan

apply:
  stage: apply
  when: manual
  script:
    - terraform apply -auto-approve tfplan
```

---

## ⚙️ Recommended Practices

| Category             | Recommendation                                                                              |
| -------------------- | ------------------------------------------------------------------------------------------- |
| **Version Control**  | Pin Terraform and provider versions in `required_version` and `required_providers`.         |
| **Workspaces**       | Use `terraform workspace` for isolated state per environment.                               |
| **State Management** | Use remote backends (S3, Azure Storage, or GitLab-managed Terraform state).                 |
| **Security**         | Store sensitive variables in GitLab CI/CD variables or `.tfvars` excluded via `.gitignore`. |
| **Linting**          | Run `terraform fmt -recursive` and `terraform validate` before committing.                  |
| **Docs**             | Use `terraform-docs` to generate module documentation automatically.                        |

---

## 🧾 Useful Commands

| Command                | Description                               |
| ---------------------- | ----------------------------------------- |
| `terraform fmt`        | Format Terraform configuration files.     |
| `terraform validate`   | Validate syntax and structure.            |
| `terraform graph`      | Generate a dependency graph of resources. |
| `terraform output`     | Display output values after apply.        |
| `terraform state list` | Show all resources in the current state.  |

---

## 🧑‍💻 Troubleshooting

| Issue                               | Resolution                                                        |
| ----------------------------------- | ----------------------------------------------------------------- |
| Backend authentication fails        | Verify credentials (AWS CLI or Azure CLI).                        |
| Plan fails due to missing variables | Check variable declarations in `variables.tf` or `.tfvars`.       |
| State lock issues                   | Use `terraform force-unlock <LOCK_ID>` cautiously.                |
| Permission denied                   | Ensure IAM roles or service principals have required permissions. |

---

## 🧠 Additional Resources

* [Terraform Registry](https://registry.terraform.io/)
* [Terraform Cloud](https://app.terraform.io/)
* [GitLab Terraform Integration Docs](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform.html)
* [HashiCorp Best Practices](https://developer.hashicorp.com/terraform/language/modules/develop)

---

## 📜 License

This project is licensed under the MIT License.
See the [LICENSE](LICENSE) file for more information.

---

## 🧩 Maintainer

**Author:** Matthew Nico
**Role:** Cloud Strategy & Operations Manager
**Email:** *[[your.email@example.com](mailto:your.email@example.com)]*
**Organization:** *[Your Org / Program / Contract Name]*

```

---

Would you like me to include a `.gitlab-ci.yml` template (with GitLab variable integration, artifact retention, and optional Terraform Cloud backend support) directly after this section for end-to-end automation?
```
