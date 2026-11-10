# Azure + AWS Hybrid Platform

This repo is where I build real-world projects that show what I can do as I learn cloud engineering, cloud security, DevOps, DevSecOps and AI. Everything here follows one realistic business scenario, and each project solves a problem a cloud engineer would actually face in it.

## The scenario

**Hylia Logistics** is a mid-size company that runs on Microsoft 365, Entra ID and Azure, with its own on-prem datacenter. It just acquired **Sheikah Labs**, a startup that built everything on AWS.

As the cloud engineer brought in to integrate the two, my job is to deliver:

- one set of identities, with least privilege on both sides
- governed environments with guardrails from day one
- connected networks between HQ, Azure and AWS, segmented rather than flat
- one guarded pipeline for every infrastructure change
- one place to detect and respond to threats in both clouds
- proof that both clouds meet the CIS benchmarks, and keep meeting them

Acquisitions are one of the most common reasons companies end up multi-cloud. My homelab plays the part of Hylia's on-prem datacenter, so the hybrid networking uses real VPN tunnels.

## Projects

| # | Project | What it covers | Status |
|---|---|---|---|
| 1 | Identity and governance | Entra ID Conditional Access, PIM and custom RBAC, management groups and Azure Policy, Entra as the sign-in for AWS through SAML federation, AWS IAM guardrails | In progress |
| 2 | Secure delivery pipeline | GitHub Actions with OIDC (no stored cloud keys), Terraform plan and apply with approvals, layered secret protection (push protection, Gitleaks on every pull request, secret scanning alerts), IaC scanning with Checkov, Dependabot and actions pinned to commit SHAs, policy as code, drift detection, scheduled teardown of expired resources. The first workload through it is a shipment-tracking Azure Function that writes to Blob Storage with a managed identity, so there are no keys to leak | Planned |
| 3 | Hybrid network | AWS Transit Gateway and Azure hub-and-spoke, site-to-site IPsec VPN with BGP from the on-prem side to both clouds, on a dynamic home IP | Planned |
| 4 | Detection and response | Microsoft Sentinel as one SIEM for both clouds, custom KQL rules and automated playbooks, plus GuardDuty, EventBridge and Lambda for containment on the AWS side | Planned |
| 5 | Kubernetes and supply chain | Hardened k3s with GitOps, only signed images allowed to run, runtime alerts into the SIEM, and a short AKS comparison | Planned |
| 6 | Continuous compliance | Prowler and Defender for Cloud mapped to CIS across both clouds and the cluster, with fixes made through pull requests | Planned |

Each project folder includes:

- the problem it solves in the scenario
- an architecture diagram
- the decisions I made and why, including what I'd change at real scale
- what it cost to build, and what it would cost in production
- the code that builds it

## How it's built

- Everything ends up in Terraform. When I build something in the portal first to learn how it works, I import it into code afterward and let Terraform own it from then on. Teardown is one `terraform destroy` with nothing left behind.
- Each project ships a small working version first, then grows. Something finished beats something half built.
- Costs stay low on purpose. Anything billed by the hour gets built in a timed session, documented, and destroyed.
- Write-ups cover what went wrong, not just what worked.

## Credits

Some of the smaller pieces in projects 2 and 6 started as project ideas from W. J. Pearce, a cloud security engineer who shares hands-on projects on YouTube: secret scanning with Gitleaks and GitHub's built-in tools, Dependabot, a keyless serverless workload, and an early posture check with a cloud security posture management tool. His versions are mostly AWS-based. I adapted them to fit the scenario and the Microsoft side of the stack.

- [6 Cloud Security Projects Help To Get You Hired 2026](https://www.youtube.com/watch?v=tEIMZdEdLsc)
- [BEST Beginner DevSecOps & Cloud Security Project](https://www.youtube.com/watch?v=6HNetAnewCA)
- [AWS Cloud Projects: Insights from a Cloud Security Engineer](https://www.youtube.com/watch?v=JMUeoVu5RRg) (interview on Caleb Oni's channel)

## Using AI

I use Claude Code throughout these projects as a mentor. I do the work, and use it to shorten the learning curve and close knowledge gaps through discussion. AI is becoming part of the everyday tech stack, so learning to use it well is one of the goals here. It helps with the work, but it doesn't replace knowing how to do it or how to tell when it's done right.

## Earlier work

This repo replaces my first portfolio repo, [cloud-security-portfolio](https://github.com/coreykcreech/cloud-security-portfolio), which is archived. The Azure network build from there gets rebuilt here as part of project 3.

## Certifications and education

- CompTIA Security+
- CompTIA Cloud+
- AS in Network Systems Security, St. Petersburg College (in progress)

## Contact

Corey Creech | [LinkedIn](https://www.linkedin.com/in/coreykcreech/) | [Email](mailto:coreykcreech@gmail.com)

---

*Hylia Logistics and Sheikah Labs are fictional. The names are borrowed from The Legend of Zelda: Ocarina of Time. No affiliation with Nintendo.*
