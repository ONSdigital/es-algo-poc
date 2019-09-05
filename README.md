<br />
<p align="center">
 <h3 align="center">Setup a private, encrypted and versioned AWS S3 bucket using Terraform</h3>
</p>

# Table of Contents

<!-- vim-markdown-toc GFM -->

* [About The Project](#about-the-project)
* [Prerequisites](#prerequisites)
* [Usage : Execute the terraform scripts](#usage--execute-the-terraform-scripts)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [License](#license)

<!-- vim-markdown-toc -->


<!-- ABOUT THE PROJECT -->
## About The Project

This Terraform project creates a private, versioned and encrypted AWS S3 bucket

At the end of the execution the output displays the S3 bucket's details

## Prerequisites
1. AWS CLI configured with credentials to access AWS S3
2. Terraform version >=0.12

<!-- GETTING STARTED -->
## Usage : Execute the terraform scripts

Execute the terraform scripts as follows:
```
# Minimal invocation : Uses randomly generated alphanumeric team-name
terraform apply

# Recommended invocation : Uses randomly generated alphanumeric team-name
terraform apply -var "team-name=my-team-name"
```

The `team-name` variable is optional, but highly recommended to be set as your team's name.
If not supplied a random string is generated and used as the team-name

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| team-name | String used to prefix the S3 bucket. Random value used if not supplied. | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_arn | The ARN of the S3 bucket |
| s3\_bucket\_aws\_console\_link | AWS Console link for the S3 bucket |
| s3\_bucket\_name | The Name of the S3 bucket |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Copyright (c) 2017 Crown Copyright (Office for National Statistics)

Released under MIT license, see [LICENSE](LICENSE) for details.

