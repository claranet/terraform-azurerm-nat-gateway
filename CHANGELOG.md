## 8.0.0 (2024-11-22)

### ⚠ BREAKING CHANGES

* **AZ-1088:** module v8 structure and updates

### Features

* **AZ-1088:** module v8 structure and updates 8ca5eda

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.4 12d2bc1
* **deps:** update dependency tflint to v0.54.0 8ad5b1a
* **deps:** update dependency trivy to v0.57.1 b3ae7b9
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 5a4407b
* **deps:** update tools e9c163d

## 7.0.0 (2024-10-16)

### ⚠ BREAKING CHANGES

* **AZ-1088:** tf 1.3+ and AzureRM v3

### Features

* **AZ-1088:** tf 1.3+ and AzureRM v3 dc03a78

## 5.1.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider e1a1bc1

### Documentation

* update README badge to use OpenTofu registry 5b57bc0

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] eefc80d
* **AZ-1391:** update semantic-release config [skip ci] 1893d49

### Miscellaneous Chores

* **deps:** add renovate.json df648ad
* **deps:** enable automerge on renovate d997128
* **deps:** update dependency opentofu to v1.7.0 3a510df
* **deps:** update dependency opentofu to v1.7.1 13884fb
* **deps:** update dependency opentofu to v1.7.2 27cb7fa
* **deps:** update dependency opentofu to v1.7.3 5e69371
* **deps:** update dependency opentofu to v1.8.0 876ba6a
* **deps:** update dependency opentofu to v1.8.1 adddff6
* **deps:** update dependency opentofu to v1.8.2 81c15b3
* **deps:** update dependency pre-commit to v3.7.1 ceb0257
* **deps:** update dependency pre-commit to v3.8.0 779ef3f
* **deps:** update dependency terraform-docs to v0.18.0 464bddf
* **deps:** update dependency tflint to v0.51.0 5c85075
* **deps:** update dependency tflint to v0.51.1 bc93968
* **deps:** update dependency tflint to v0.51.2 04180be
* **deps:** update dependency tflint to v0.52.0 6dba2a4
* **deps:** update dependency tflint to v0.53.0 53a238e
* **deps:** update dependency trivy to v0.50.2 c7f12ef
* **deps:** update dependency trivy to v0.50.4 f91d3ca
* **deps:** update dependency trivy to v0.51.0 fe80b58
* **deps:** update dependency trivy to v0.51.1 8b547e5
* **deps:** update dependency trivy to v0.51.2 7957695
* **deps:** update dependency trivy to v0.51.4 2e00ee8
* **deps:** update dependency trivy to v0.52.0 1cf4544
* **deps:** update dependency trivy to v0.52.1 db51272
* **deps:** update dependency trivy to v0.52.2 6ab6a05
* **deps:** update dependency trivy to v0.53.0 fef7aa6
* **deps:** update dependency trivy to v0.54.1 d0d13f7
* **deps:** update dependency trivy to v0.55.0 6f87433
* **deps:** update dependency trivy to v0.55.1 50972c1
* **deps:** update dependency trivy to v0.55.2 ab30960
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 e46509f
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 e3af54e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 762bf7e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 209489b
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 1e7b7ef
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 63712dc
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 a34b6f0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 dd12871
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 5889e04
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 06dba9d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 ecfbbf0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 b810158
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 65bc15c
* **deps:** update renovate.json 453c433
* **deps:** update tools e440fb2
* **pre-commit:** update commitlint hook 382b977
* **release:** remove legacy `VERSION` file 41daa3d

# v5.0.0 - 2022-12-09

Added
  * AZ-917 : Add public ip Domain dns label option
  * AZ-917 : Add public ip Reverse Fqdn option

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

# v4.1.0 - 2022-04-15

Added
  * AZ-615: Add an option to enable or disable default tags

Changed
  * AZ-572: Revamp examples and improve CI

# v3.0.1/v4.0.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool
  * AZ-530: Cleanup module, fix linter errors

# v1.0.0/v3.0.0/v4.0.0 - 2021-03-09

Added
  * AZ-427: Create NAT Gateway module
