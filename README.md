# Home Enterprise Operations == A Bunch of YAML
<div align="center">

<img src="./docs/assets/home-ops-logo.png" align="center" width="144px" height="144px"/>

Just a YAML monorepo that I run all of my Kubernetes stuff with.
</div>

## Directories

```sh
📁 ansible             # AWX playbooks
📁 kubernetes          # main cluster
├── 📁 apps             # applications
├── 📁 bootstrap        # bootstrap procedures
└── 📁 flux             # core flux configuration
📁 talos               # talos configuration
📁 terraform           # terraform for talos nodes
```

## ☁️ External Dependencies
If you know me, you know I am not a fan of paying for cloud services. That being said there are some cloud services that are needed in order for this whole thing to work.   
| Service                                         | Use                                                               | Cost           |
|-------------------------------------------------|-------------------------------------------------------------------|----------------|
| [Cloudflare](https://www.cloudflare.com/)       | Internal and External Domain                                      | ~$25/yr        |
| [GitHub](https://github.com/)                   | Hosting this repository and continuous integration/deployments    | Free           |
| [Purely Mail](https://purelymail.com/)          | Email hosting                                                     | ~$5/yr         |
| [Backblaze](https://www.backblaze.com/)         | S3 Compatible Backup                                              | $6/TB/mo       |
|                                                 |                                                                   | Total: ~$50/yr |
