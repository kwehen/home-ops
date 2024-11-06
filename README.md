# Home Enterprise Operations == A Bunch of YAML
<div align="center">

<img src="./docs/assets/home-ops-logo.png" align="center" width="144px" height="144px"/>

Just a YAML monorepo that I run all of my Kubernetes stuff with.
</div>

## ☁️ Why?
At some point I got sick of running `docker container stop 454HIHER74N && docker container rm 454HIHER74N`. Eventually I set an alias for `docker compose up -d`. Creating a **<ins>VM</ins>** to put 25 loose containers on it stopped being sensical to me. I don't even remeber what's running on this thing?! 

"This term keeps getting thrown around...kubus? Kambanets? Confucious?"

"Kubernetes?"

"Yea, that thing."

## 📁 Directories

```sh
📁 ansible             # AWX playbooks
📁 kubernetes          # main cluster
├── 📁 apps             # applications
├── 📁 bootstrap        # bootstrap procedures
└── 📁 flux             # core flux configuration
📁 talos               # talos configuration
📁 terraform           # terraform for talos nodes
```

## 🌾 Core
- [Longhorn](https://longhorn.io/) - distributed block storage for Kubernetes.
- [Metallb](https://metallb.universe.tf/) - load-balancer for bare metal Kubernetes clusters.
- [Traefik](https://github.com/traefik/traefik) - HTTP reverse proxy and load balancer.
- [cert-manager](https://github.com/cert-manager/cert-manager) - X.509 certificate management for Kubernetes.
- [CloudNativePG](https://cloudnative-pg.io/) - highly available PostgreSQL database cluster. 

## 👫 Dependencies
I am not a fan of paying for cloud services. That being said there are some cloud services that are needed in order for this to work. CapEx over OpEx because I prefer ownership. 
| Service                                         | Use                                                               | Cost           |
|-------------------------------------------------|-------------------------------------------------------------------|----------------|
| [Cloudflare](https://www.cloudflare.com/)       | Internal and External Domain                                      | ~$25/yr        |
| [GitHub](https://github.com/)                   | Hosting this repository and continuous integration/deployments    | Free           |
| [Purely Mail](https://purelymail.com/)          | Email hosting                                                     | ~$5/yr         |
| [Backblaze](https://www.backblaze.com/)         | S3 Compatible Backup                                              | $6/TB/mo       |
|                                                 |                                                                   | Total: ~$50/yr |
## 📖 Docs
This blog will be on this cluster at some point. But for the time being: 
## 🚧 [The Hyperbolic Chamber](https://khenry.substack.com/) 🚧
- [Running a Button on Kubernetes](https://khenry.substack.com/p/button-on-kubernetes)
- [A Collection of Things That Won't Spy On You](https://khenry.substack.com/p/a-collection-of-things-that-wont)
- [Recovering From Questionable Homelab Design Decisions](https://khenry.substack.com/p/recovering-from-questionable-homelab)
- [Unifi Backups So You Don't Have To](https://khenry.substack.com/p/unifi-backups-so-you-dont-have-to)