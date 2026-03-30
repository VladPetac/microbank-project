# MicroBank DevOps Project — Analysis & Improved Plan

---

## Analysis

### 1. JD Gap Analysis — Cross-Reference Table

| JD Skill/Requirement | Current Plan Coverage | Action Needed |
|---|---|---|
| **GitLab CI/CD** | ✅ Covered | Phase 6-7 cover this well. Keep and refine. |
| **GitHub experience** | ❌ Missing | Plan only uses GitLab. Must add GitHub Actions basics, GitHub repos, PRs on GitHub. |
| **Ansible — config management & deployment** | ✅ Covered | Phase 10 covers this. Needs minor tightening to JD language. |
| **Docker containerization** | ✅ Covered | Phases 4-5 cover this thoroughly. |
| **OpenShift** | ⚠️ Partially covered | Phase 9 mentions "OpenShift concepts (theory)" as a bullet point with comparison notes. This is insufficient — the JD lists OpenShift alongside Kubernetes as a core skill. Must add hands-on OpenShift exercises using OpenShift Local (CRC) or the free Developer Sandbox. |
| **Kubernetes** | ✅ Covered | Phases 8-9 are thorough. |
| **Git & GitHub — VCS** | ⚠️ Partially covered | Git is covered in Phase 2 but GitHub is absent. Must add GitHub-specific workflows (PRs, Issues, GitHub Actions). |
| **Artifactory — artifact repository** | ⚠️ Partially covered | Phase 11 mentions "Artifactory concepts" and uses a local Docker registry as a "stand-in." The JD names Artifactory explicitly. Must add JFrog Artifactory free tier or OSS setup with actual artifact upload/download exercises. |
| **Java applications & microservice architecture** | ⚠️ Partially covered | The plan uses Java apps but never explains what Java is, what a JAR is, what Maven does, or what microservice architecture means. A beginner needs a conceptual overview before touching these. |
| **SDLC understanding** | ❌ Missing | The JD explicitly says "Intelegi ciclul de viata al dezvoltarii software (SDLC)." Zero coverage in current plan. Must add an SDLC module in Week 1. |
| **CI/CD pipeline tools understanding** | ✅ Covered | Phases 6-7. |
| **DevOps automation & orchestration** | ✅ Covered | Across multiple phases. |
| **Helping team migrate to CI/CD best practices** | ❌ Missing | No collaboration or migration simulation. Must add an exercise where learner documents a "migration plan" for a fictional team. |
| **Software delivery management with approvals** | ⚠️ Partially covered | Phase 6 mentions "manual approval gate" as one bullet. The JD emphasizes delivery management with approvals at every stage. Must expand with proper environment promotion gates, change request simulation. |
| **Working with stakeholders to clarify requirements** | ❌ Missing | No exercise on requirements gathering, writing technical specs, or communicating with non-DevOps roles. Must add. |
| **Collaboration with developers, testers, infra engineers** | ❌ Missing | No simulation of team collaboration. Must add PR review exercises, writing clear documentation for other roles. |
| **Cloud deployment scripting** | ❌ Missing | The JD says "mediu cloud." Current plan is 100% local. Must add cloud basics (AWS free tier or GCP). |
| **Creating presentations for Ops teams** | ❌ Missing | The JD explicitly says "Furnizezi prezentari catre echipele care vor functiona in OPS." Must add a handoff documentation / presentation task. |
| **Communication & teamwork skills** | ❌ Missing | No exercises on written communication, documentation quality, or explaining technical decisions. |

**Summary:** 6 items fully covered, 5 partially covered, 7 completely missing. The plan is technically solid but ignores the "soft DevOps" skills that make up roughly 40% of the JD.

---

### 2. Cognitive Load Audit for True Beginners

| Plan Reference | Assumed Knowledge | Required Micro-Lesson |
|---|---|---|
| Phase 4: "multi-stage build (Maven build → JRE slim runtime)" | Knows what Maven is, what a build stage is, what JRE means, what "runtime" means | Must explain: What is Java? What is a JAR file? What does Maven do? What is JRE vs JDK? Why multi-stage? |
| Phase 4: "Non-root users in containers" | Understands Unix user model and why root is dangerous | Must explain root vs regular users, security implications |
| Phase 5: "container DNS" | Knows what DNS is | Must explain DNS basics before Docker networking |
| Phase 5: "Health checks in Compose" | Knows what a health check is and why services need them | Must explain: what does "healthy" mean for a service? |
| Phase 6: "Docker executor" | Knows what a CI executor is and why it matters | Must explain: what is a runner, what is an executor, why Docker executor |
| Phase 6: "DAG pipeline" | Knows what a DAG is | Must explain Directed Acyclic Graph concept simply |
| Phase 8: "Pod lifecycle" | Understands containers enough to grasp pod abstraction | Must build on Docker knowledge explicitly |
| Phase 9: "JVM warm-up consideration" | Knows JVM internals | Remove or simplify to "Java apps take longer to start — set generous startup probes" |
| Phase 9: "Helm chart" | Understands templating and package management concepts | Must explain: what is a package manager? What problem does Helm solve? |
| Phase 10: "agentless architecture" | Knows what agent-based tools are (Puppet, Chef) to understand the contrast | Explain simply: "Ansible connects via SSH, no software to install on target machines" |
| Phase 10: "Jinja2 templates" | Knows what templating is | Must explain: what is a template? Variable substitution concept |
| Phase 11: "local, remote, virtual repositories" | Knows Artifactory architecture | Must explain with analogy (local = your bookshelf, remote = library, virtual = combined catalog) |
| Phase 12: "PromQL" | Knows query language concepts | Must introduce with concrete examples, not just "PromQL basics" |
| Phase 12: "SLI/SLO" | Knows reliability engineering concepts | Must explain from scratch with real-world analogies |
| Phase 2: "`rebase`, `cherry-pick`, `stash`, `reflog`, `bisect`" | Comfortable enough with Git basics to tackle advanced operations | These are too much for Day 3-4 for a true beginner. Move advanced Git to later or appendix. |
| Phase 3: "`sed`, `awk`" | Understands regex concepts | Must teach regex basics before sed. Awk can be cut. |
| Phase 3: "Anchors, aliases, merge keys in YAML" | Has written basic YAML | These are advanced YAML features rarely needed by juniors. Move to appendix. |

**Critical finding:** Almost every phase assumes 1-3 concepts the learner has never encountered. The plan reads like it was written for someone who already knows one programming language and has used a terminal casually.

---

### 3. Realism Audit

**What's missing that they'd encounter on Day 1 at an enterprise bank:**

- **Ticketing systems**: All work starts with a Jira/ServiceNow ticket. No mention anywhere.
- **Change management**: Enterprise banks require Change Requests (CRs) before ANY production change. Completely absent.
- **Environment naming conventions**: DEV → SIT → UAT → PREPROD → PROD. The plan uses only dev/staging.
- **Approval gates with multiple sign-offs**: Not just "manual approval" — real banks need approvals from Dev Lead, QA Lead, Release Manager, and sometimes Security.
- **Runbooks**: Already included (good), but should be more prominent.
- **Incident response basics**: What to do when a deployment fails in production. Absent.
- **Access control and least privilege**: Banks are strict about who can deploy where. Mentioned briefly in K8s secrets but not as a workflow pattern.
- **Documentation culture**: Everything is documented. Meeting notes, decision logs, deployment records. Absent.
- **Working with Windows servers**: Many bank systems still use Windows. Not critical but worth mentioning.

**What's included that a junior wouldn't touch in the first 6 months:**

- **Helm chart authoring from scratch**: Juniors use existing charts. They don't write Chart.yaml. Move to "nice to have."
- **Blue-green deployment scripting**: Juniors don't design deployment strategies. They follow existing ones. Simplify to "understand the concept."
- **Prometheus/Grafana deep setup**: Juniors use existing dashboards. They don't deploy Prometheus from scratch. Reframe as "understand and use existing monitoring."
- **Writing NetworkPolicy debugging**: Too advanced for month 1-6. Move to appendix.
- **HashiCorp Vault setup**: Not in JD. Remove or reduce to awareness.
- **Sealed Secrets**: Remove entirely.
- **Custom Nginx configuration as API gateway**: Juniors rarely configure Nginx from scratch. Keep basic but don't over-invest time.

**Missing enterprise patterns:**

- **Environment promotion workflow**: Code moves DEV → SIT → UAT → PROD with gates
- **Branch protection rules**: Main branch requires PR + review + CI pass
- **Audit trails**: Who deployed what, when, and why (Git history as audit log)
- **Rollback procedures**: Documented, rehearsed, not ad-hoc
- **Communication during deployments**: Notifying stakeholders before/after releases

---

### 4. Assessment Gap Audit

| Phase | Current Verification | Proves Competence? | Improvement |
|---|---|---|---|
| Phase 1: Linux | "Write a cheat sheet of 30 commands from memory" | ❌ Memorizing commands ≠ knowing when/why to use them | Replace with scenario: "Given a log file, find all errors from today, count them, save to a report" |
| Phase 2: Git | "Complete simulated workflow with 3 branches and 2 conflicts" | ⚠️ Proves mechanics, not understanding | Add: "Explain WHY you would use a feature branch instead of committing directly to main" |
| Phase 3: YAML & Bash | "Write a script that reads JSON, validates, creates dirs, logs" | ❌ True beginner cannot write this from description alone | Provide 80% complete script, ask learner to add missing parts + debug intentional errors |
| Phase 4: Docker | "All 3 images build successfully, each under 200MB" | ⚠️ Proves the build works, not that learner understands layers, caching, or debugging | Add: "A Dockerfile is given with 3 mistakes. Find and fix them." |
| Phase 5: Docker Compose | "curl returns data through full chain" | ⚠️ Proves it works, not debugging ability | Add: "docker-compose.yml has 2 errors preventing startup. Fix without looking at the solution." |
| Phase 6: GitLab CI | "Push triggers pipeline" | ⚠️ Proves setup, not understanding | Add: "Pipeline fails with error X. Diagnose and fix." + "Explain what each stage does to a colleague" |
| Phase 7: Scripts | "Scripts handle failure gracefully" | ✅ Good — tests failure handling | Keep, add "explain your rollback logic verbally" |
| Phase 8: K8s | "kubectl get all shows running resources" | ❌ Just proves apply worked | Add: "Pod is in CrashLoopBackOff. Use only kubectl to find and fix the problem." |
| Phase 9: K8s + Helm | "helm install deploys full stack" | ⚠️ Proves the chart works, not understanding | Add: "Change a value in values.yaml and predict what will change before running upgrade" |
| Phase 10: Ansible | "ansible-playbook --check shows no changes" | ✅ Good — tests idempotency | Add: "Playbook fails on a new host. Debug and fix." |
| Phase 11: Artifacts | "Trivy scan passes" | ⚠️ Proves scanning, not remediation understanding | Add: "A CRITICAL CVE is found. Show the steps to fix it." |
| Phase 12: Monitoring | "Dashboard shows live metrics" | ⚠️ Proves setup, not operational use | Add: "Given this Grafana dashboard, identify which service is unhealthy and why" |
| Phase 13: Capstone | "Record terminal session" | ❌ Recording ≠ competence | Replace with: "Write a deployment report documenting what you did, what went wrong, how you fixed it" |

**Summary:** Most verifications prove "I set it up and it runs" but not "I understand it and can debug it." Must add debugging exercises and "explain it" tasks throughout.

---

### 5. Time Budget Audit

**Assumptions:** True beginner, 7 hours productive per day (accounting for breaks, context switching, installation issues).

| Phase | Allocated | Realistic Estimate | Issue |
|---|---|---|---|
| Phase 1: Linux (Days 1-2) | 14h | 14h | ✅ Reasonable for basics. SSH might need more time. |
| Phase 2: Git (Days 3-4) | 14h | 10h basics + 4h overflow | ⚠️ Advanced Git (rebase, cherry-pick, bisect, reflog) is too much. Cut advanced to save time. |
| Phase 3: YAML & Bash (Days 5-7) | 21h | 28h+ | ❌ **Severely underestimated.** YAML is 4h, but Bash scripting from zero (variables, conditionals, loops, functions, pipes, grep, sed, awk, jq, error handling) is easily 3-4 full days for a beginner. `awk` alone could take a full day. Must cut awk, reduce sed, and spread over more time OR move advanced scripting to Week 3. |
| Phase 4: Docker (Days 1-3) | 21h | 21h | ✅ Reasonable if micro-lessons on Java/Maven/JRE are added. |
| Phase 5: Docker Compose (Days 4-7) | 28h | 21h | ⚠️ Overallocated if learner understood Phase 4. Can use spare time for catch-up. |
| Phase 6: GitLab CI (Days 1-4) | 28h | 35h+ | ❌ **Severely underestimated.** Setting up GitLab Runner alone can take half a day with troubleshooting. Writing a multi-stage pipeline with caching, artifacts, rules, DAG is easily a full week for a beginner. |
| Phase 7: Adv. Scripting (Days 5-7) | 21h | 21h | ⚠️ Depends heavily on Bash skill from Phase 3. If Phase 3 was rushed, this will fail. |
| Phase 8: K8s Fundamentals (Days 1-3) | 21h | 28h | ❌ **Underestimated.** K8s concepts are the steepest learning curve in the plan. Minikube installation issues alone can burn hours. Understanding Pods, Deployments, Services, ConfigMaps, Secrets, PVCs from zero needs more time. |
| Phase 9: Full K8s + Helm (Days 4-7) | 28h | 35h+ | ❌ Writing all K8s manifests + Helm chart + OpenShift concepts + CI integration in 4 days is unrealistic. Helm alone needs 2 days. |
| Phase 10: Ansible (Days 1-5) | 35h | 28h | ⚠️ Overallocated. Ansible basics are quicker to pick up than K8s. Can rebalance time to K8s. |
| Phase 11: Artifacts (Days 6-7) | 14h | 14h | ✅ Reasonable if scoped correctly. |
| Phase 12: Monitoring (Days 1-4) | 28h | 21h | ⚠️ Can be compressed. Juniors don't set up monitoring stacks. |
| Phase 13: Capstone (Days 5-7) | 21h | 28h+ | ⚠️ Ambitious for 3 days. Needs realistic scoping. |

**Critical time issues:**
1. Week 1 Day 5-7 (Bash) is a time bomb. A beginner will feel overwhelmed.
2. Week 3-4 transition (CI/CD → K8s) has no buffer. Both are massive topics.
3. No "catch-up" days built into the schedule. Beginners WILL fall behind.
4. **Recommendation:** Add 1 buffer day per week (Day 7 = review/catch-up) and cut low-priority content to create space.

---

## Improved MicroBank DevOps Project Plan

> **Purpose:** Take a complete beginner from zero terminal experience to job-ready for a Junior DevOps Engineer role at a European enterprise bank in 6 weeks.

> **Approach:** One growing project — "MicroBank" — a simple banking app that you containerize, pipeline, orchestrate, and monitor. You never write the Java code. You build everything around it.

> **Time commitment:** 6-8 hours/day, 6 days/week (Day 7 = rest or catch-up). Total: ~250 productive hours.

> **Language:** English for all technical content (industry standard). Romanian notes where helpful.

---

### Prerequisites & Setup

Before Day 1, complete these steps (budget 2-3 hours):

**Hardware requirements:**
- PC or Mac with at least 8GB RAM (16GB ideal), 50GB free disk space
- Stable internet connection

**Software to install NOW (everything else is installed phase-by-phase):**

For Windows users:
```bash
# Step 1: Enable WSL2 (Windows Subsystem for Linux)
# Open PowerShell as Administrator and run:
wsl --install

# This installs Ubuntu. Restart your computer when prompted.
# After restart, Ubuntu will open and ask you to create a username and password.
# REMEMBER THIS PASSWORD — you'll use it often.
```

For Mac users:
```bash
# Open Terminal (press Cmd+Space, type "Terminal", press Enter)
# Install Homebrew (the Mac package manager):
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Accounts to create NOW (all free):**
1. **GitHub** account at https://github.com — you'll use this for code hosting and collaboration
2. **GitLab** account at https://gitlab.com — you'll use this for CI/CD pipelines
3. **Docker Hub** account at https://hub.docker.com — you'll use this for container images

💡 **Tip:** Use the same professional email for all accounts. Use a professional username (e.g., `maria-popescu`, not `coolhacker99`).

**Create your project folder:**
```bash
# Open your terminal (Ubuntu on Windows, Terminal on Mac)
mkdir -p ~/microbank-project
cd ~/microbank-project
echo "MicroBank DevOps Project - Started $(date)" > README.md
cat README.md
# You should see: MicroBank DevOps Project - Started [today's date]
```

✅ **You just ran your first terminal commands.** You created a folder, moved into it, created a file, and read it. Everything in this guide builds on exactly this pattern.

---

### How to Use This Guide

1. **Follow phases in order.** Each phase builds on the previous one.
2. **Type every command yourself.** Do NOT copy-paste until you've typed it at least once.
3. **When something breaks, troubleshoot for 15 minutes before searching.** Then check the "Common mistakes" section. Then search online. Learning to debug is half the job.
4. **Keep a learning journal.** After each day, write 3-5 sentences: what you did, what was hard, what you'd explain to someone else. This builds the documentation habit the job requires.
5. **Symbols in this guide:**
   - ⏱️ = estimated time for this task
   - 💡 = helpful tip
   - ⚠️ = common mistake or warning
   - ✅ = verification step — confirm before moving on
   - 🔧 = debugging exercise
   - 📝 = write something down (documentation practice)

---

## Week 1: Foundations

> This week's goal: Be comfortable in a terminal, manage code with Git, understand YAML files, and automate simple tasks with Bash scripts. By Friday, you'll have a working Git repository with scripts and configs for MicroBank.

---

### Phase 0: The Big Picture — SDLC & DevOps (Day 1 morning)

**Goal:** Understand where DevOps fits in the software development lifecycle so that every subsequent phase makes sense in context.

**Why this matters for the job:** The JD explicitly requires understanding "ciclul de viata al dezvoltarii software (SDLC)" and understanding "diferitele instrumente de dezvoltare a CI/CD digital pipelines." If you can't explain the big picture, you can't discuss it in an interview or with colleagues.

**Tools & setup:** None — this is a concepts-only module. Just your brain, a notepad (physical or digital), and optionally a web browser for the recommended reading.

**⏱️ Total: ~2 hours**

#### Concepts to Learn First

**What is software?**
Software is a set of instructions that tells a computer what to do. A banking app, a website, a mobile app — all software. Someone writes the code (instructions), and then that code needs to get from the developer's computer to a server where customers can use it. That journey is what DevOps is about.

**What is SDLC?**
SDLC = Software Development Life Cycle. It's the process of planning, building, testing, deploying, and maintaining software. Think of it like building a house:

1. **Plan** — What do we want to build? What are the requirements? (Architects draw blueprints)
2. **Develop** — Write the code. (Construction workers build the house)
3. **Build** — Compile/package the code into something runnable. (Assemble the prefab parts)
4. **Test** — Check that it works correctly. (Building inspection)
5. **Release** — Approve it for deployment. (Get occupancy permit)
6. **Deploy** — Put it on servers where users can access it. (Move in the furniture)
7. **Operate** — Keep it running, monitor it, fix issues. (Maintenance)
8. **Monitor** — Watch for problems. (Security cameras, smoke detectors)

**What is DevOps?**
DevOps = Development + Operations. Historically, developers ("Dev") wrote code and threw it to operations ("Ops") to deploy and manage. This caused friction — "it works on my machine!" DevOps bridges that gap through:
- **Automation** — scripts and tools instead of manual clicks
- **CI/CD** — Continuous Integration / Continuous Delivery (we'll cover these in depth in Week 3)
- **Infrastructure as Code** — treating servers and environments like code (version controlled, repeatable)
- **Monitoring** — knowing what's happening in production
- **Collaboration** — Dev and Ops working together, not in silos

**What does a Junior DevOps Engineer do at a bank?**
- Maintains CI/CD pipelines (the automated flow from code → production)
- Writes scripts to automate deployments
- Manages containers (Docker) and orchestration (Kubernetes/OpenShift)
- Configures servers and environments (Ansible)
- Manages artifact repositories (Artifactory — where built software is stored)
- Monitors applications (dashboards, alerts)
- Documents processes and creates runbooks
- Collaborates with developers, testers, and infrastructure engineers

**What is MicroBank?**
MicroBank is the project you'll build throughout this guide. It's a simplified banking application with:
- **Account Service** — handles bank accounts (a Java application)
- **Transaction Service** — handles money transfers (another Java application)
- **PostgreSQL** — the database (stores account and transaction data)
- **Nginx** — a reverse proxy (routes requests to the right service)

You will NOT write the Java code. The applications are pre-built. Your job — like a real DevOps engineer — is to:
1. Package them (Docker)
2. Automate their build and testing (CI/CD)
3. Deploy them (Kubernetes/OpenShift)
4. Configure their environments (Ansible)
5. Monitor them (Prometheus/Grafana)

**Enterprise environments at banks:**
Banks typically have these environments:
- **DEV** — developers test their code
- **SIT** (System Integration Testing) — test that all components work together
- **UAT** (User Acceptance Testing) — business users verify the software
- **PREPROD** — final check, mirrors production
- **PROD** (Production) — real customers use this

Moving code between environments requires **approvals** (change management). A junior DevOps engineer helps manage this process.

#### Tasks

**Task 1: Draw the SDLC** ⏱️ ~20 min
On paper or in a drawing tool, draw the SDLC cycle as a circle with 8 stages. For each stage, write one tool you think is used (guess — we'll refine later). Keep this drawing; you'll update it at the end of each week.

**Task 2: Map MicroBank to SDLC** ⏱️ ~15 min
Write down which phases of this guide correspond to which SDLC stages:
- Phase 4-5 (Docker) → which SDLC stage?
- Phase 6-7 (CI/CD) → which SDLC stages?
- Phase 8-9 (Kubernetes) → which SDLC stage?
- Phase 12 (Monitoring) → which SDLC stage?

**Task 3: Read the job description** ⏱️ ~20 min
Re-read the target JD (provided in your project docs). For each bullet point, write whether you currently understand it (Yes / No / Partially). You'll revisit this list every week.

📝 **Task 4: Write your first "Ops handoff" document** ⏱️ ~15 min
Imagine you need to explain MicroBank to a colleague who will run it in production. Write a 5-sentence summary covering: what it does, what components it has, and what database it uses. This practices the "furnizezi prezentari catre echipele OPS" requirement from the JD.

#### Self-Test
Answer without looking:
1. What are the 8 stages of SDLC?
2. What does CI/CD stand for? (Just the words — we'll learn the details later)
3. What's the difference between Dev and Ops?
4. Why do banks have multiple environments (DEV, SIT, UAT, PROD)?
5. In one sentence, what is YOUR role with MicroBank? (Hint: you don't write Java)

#### Interview Angle
**Q: "Can you explain the software development lifecycle?"**
A: "SDLC is the process of taking software from idea to production. It starts with planning and requirements, moves through development and building, then testing to catch bugs, release with approvals, deployment to servers, and ongoing operations and monitoring. In a DevOps context, we automate as much of this as possible — especially the build, test, and deploy stages — to deliver software faster and more reliably."

**Q: "What does a DevOps engineer do?"**
A: "A DevOps engineer bridges development and operations. We build and maintain the CI/CD pipelines that automate software delivery, manage containerized applications, configure infrastructure as code, and ensure systems are monitored and reliable. We work closely with developers, testers, and infrastructure engineers."

---

### Phase 1: Linux & Terminal (Days 1-2)

**Goal:** Navigate a Linux file system, manage files and processes, and feel confident typing commands instead of clicking icons.

**Why this matters for the job:** Every tool in DevOps runs on Linux. Every server, every container, every CI/CD runner. You will live in the terminal.

**Tools & setup:** WSL2 Ubuntu (Windows) or Terminal (Mac) — already installed in Prerequisites.

**⏱️ Total: ~12 hours across 2 days**

#### Concepts to Learn First

**What is a terminal?**
A terminal (also called "command line" or "shell") is a text-based interface for talking to your computer. Instead of clicking on folders, you type commands. It's faster and more powerful, and critically — it can be scripted (automated).

**What is Linux?**
Linux is an operating system, like Windows or macOS. Most servers worldwide run Linux. When you opened WSL2 or Mac Terminal, you entered a Linux-like environment.

**What is a "file system"?**
Files are organized in a tree structure. The top is `/` (root). Your home folder is `/home/yourusername` (Linux) or `/Users/yourusername` (Mac). The shortcut `~` means "my home folder."

**What is a "path"?**
A path is the address of a file or folder. Example: `/home/maria/documents/report.txt`. Paths starting with `/` are "absolute" (full address). Paths without `/` are "relative" (relative to where you are now).

#### Tasks

**Task 1: Your first commands** ⏱️ ~30 min

Open your terminal and type each command. Read what happens.

```bash
# Print "hello" to the screen. echo = "say this"
echo "Hello, I am learning DevOps"

# Show which folder you're currently in. pwd = "print working directory"
pwd

# List files in the current folder. ls = "list"
ls

# List files with details (permissions, size, date). -la = "long format, all files"
ls -la

# Show today's date
date

# Show your username
whoami

# Clear the screen (when it gets messy)
clear
```

✅ **Verification:** You should see your username, today's date, and a folder listing.

**Task 2: Creating and navigating folders** ⏱️ ~45 min

```bash
# Create the MicroBank project structure
# mkdir = "make directory", -p = "create parent folders too"
mkdir -p ~/microbank-project/services/account-service
mkdir -p ~/microbank-project/services/transaction-service
mkdir -p ~/microbank-project/database
mkdir -p ~/microbank-project/nginx
mkdir -p ~/microbank-project/scripts
mkdir -p ~/microbank-project/docs

# Navigate into the project
cd ~/microbank-project

# Show the tree structure (install tree first)
# apt = package manager for Ubuntu, sudo = "run as administrator"
sudo apt update && sudo apt install -y tree
tree

# Expected output:
# .
# ├── database
# ├── docs
# ├── nginx
# ├── README.md
# ├── scripts
# └── services
#     ├── account-service
#     └── transaction-service
```

```bash
# Navigate around
cd services                  # go into services folder
pwd                          # should show ~/microbank-project/services
cd account-service           # go deeper
pwd                          # should show ~/microbank-project/services/account-service
cd ..                        # go up one level (.. = parent folder)
cd ..                        # go up again, back to microbank-project
cd ~                         # go to home folder from anywhere
cd ~/microbank-project       # go directly to project (absolute path)
```

✅ **Verification:** `tree ~/microbank-project` shows the folder structure above.

**Task 3: Creating and reading files** ⏱️ ~45 min

```bash
cd ~/microbank-project

# Create a file with echo (redirect output to a file with >)
echo "# MicroBank Database Configuration" > database/README.md

# Append to a file (>> = append, > = overwrite)
echo "PostgreSQL 15" >> database/README.md
echo "Port: 5432" >> database/README.md

# Read the file
cat database/README.md

# Create a longer file for practice
# The 'tee' command writes to screen AND file simultaneously
cat << 'EOF' > docs/architecture.md
# MicroBank Architecture

## Components
- Account Service: Manages bank accounts (Java/Spring Boot)
- Transaction Service: Handles transfers (Java/Spring Boot)
- PostgreSQL: Database for persistent storage
- Nginx: Reverse proxy / API gateway

## Communication Flow
Client -> Nginx -> Account Service -> PostgreSQL
Client -> Nginx -> Transaction Service -> PostgreSQL

## Environments
- DEV: Local development (your laptop)
- SIT: Integration testing
- UAT: User acceptance testing
- PROD: Production
EOF

# Read the file
cat docs/architecture.md

# Read just the first 5 lines
head -5 docs/architecture.md

# Read just the last 3 lines
tail -3 docs/architecture.md

# Count lines, words, characters
wc docs/architecture.md
# Output: 17  48  444 docs/architecture.md
# (17 lines, 48 words, 444 characters)
```

**Task 4: Copying, moving, and deleting** ⏱️ ~30 min

```bash
cd ~/microbank-project

# Copy a file
# cp = "copy", first argument = source, second = destination
cp docs/architecture.md docs/architecture-backup.md

# Move (rename) a file
# mv = "move" (also used for renaming)
mv docs/architecture-backup.md docs/architecture-v1.md

# Verify
ls docs/
# Should show: architecture.md  architecture-v1.md

# Delete a file
# rm = "remove". BE CAREFUL — there is no recycle bin!
rm docs/architecture-v1.md
ls docs/
# Should show only: architecture.md

# Create a temp folder and delete it
mkdir temp-test
ls
rm -r temp-test    # -r = "recursive" (needed for folders)
ls                 # temp-test is gone
```

⚠️ **WARNING:** `rm` is permanent. There is no undo. Never run `rm -rf /` — it deletes everything. Always double-check your path before pressing Enter.

**Task 5: Finding things** ⏱️ ~30 min

```bash
cd ~/microbank-project

# Find files by name
find . -name "*.md"
# The . means "start from current folder"
# *.md means "any file ending in .md"

# Find folders only
find . -type d

# Search inside files for text
# grep = "search for a pattern in files"
grep "PostgreSQL" docs/architecture.md
# Output: the line containing "PostgreSQL"

# Search recursively in all files
grep -r "Service" .
# Shows every file and line containing "Service"

# Search case-insensitively
grep -ri "service" .
```

**Task 6: File permissions** ⏱️ ~45 min

```bash
# Look at file permissions
ls -la docs/architecture.md
# Output: -rw-r--r-- 1 yourname yourname 444 Mar 28 10:00 docs/architecture.md
#
# -rw-r--r-- breaks down as:
# -    = regular file (d would mean directory)
# rw-  = owner can read and write
# r--  = group can read only
# r--  = others can read only

# Create a script file
echo '#!/bin/bash' > scripts/hello.sh
echo 'echo "Hello from MicroBank!"' >> scripts/hello.sh

# Try to run it
./scripts/hello.sh
# ERROR: Permission denied! The file is not executable.

# Make it executable
chmod +x scripts/hello.sh
# chmod = "change mode", +x = "add execute permission"

# Now run it
./scripts/hello.sh
# Output: Hello from MicroBank!

# Check permissions again
ls -la scripts/hello.sh
# Now shows: -rwxr-xr-x (x = executable)
```

**Task 7: Processes and system info** ⏱️ ~30 min

```bash
# See running processes
ps aux
# Lots of output! Let's filter it:
ps aux | grep bash
# | is a "pipe" — it sends output from one command to the next
# grep filters for lines containing "bash"

# See system resource usage
top
# Press 'q' to quit top

# See disk space
df -h
# -h = "human readable" (shows GB instead of bytes)

# See memory usage
free -h
```

**Task 8: Environment variables** ⏱️ ~30 min

```bash
# Environment variables are like settings that programs can read
# See all of them:
env

# See a specific one:
echo $HOME
echo $USER
echo $PATH    # This tells the system where to find programs

# Create your own:
export MICROBANK_ENV="development"
echo $MICROBANK_ENV
# Output: development

# This variable disappears when you close the terminal.
# To make it permanent, add it to your shell config:
echo 'export MICROBANK_ENV="development"' >> ~/.bashrc

# Reload the config:
source ~/.bashrc
echo $MICROBANK_ENV
# Still shows: development
```

**Task 9: SSH basics** ⏱️ ~30 min

```bash
# SSH = Secure Shell — how you connect to remote servers securely
# Generate an SSH key pair (a "lock and key" for your identity)
ssh-keygen -t ed25519 -C "your-email@example.com"
# Press Enter 3 times to accept defaults (no passphrase for learning)

# This creates two files:
# ~/.ssh/id_ed25519       = your PRIVATE key (NEVER share this)
# ~/.ssh/id_ed25519.pub   = your PUBLIC key (safe to share)

# View your public key (you'll add this to GitHub/GitLab later)
cat ~/.ssh/id_ed25519.pub
# Copy this output — you'll need it in Phase 2

# Test SSH connection to GitHub
ssh -T git@github.com
# If you've added your key to GitHub, you'll see:
# "Hi username! You've successfully authenticated"
```

💡 **Take a break here.** You've been at it for a while. Stretch, get water, let it sink in.

#### Common Mistakes & How to Fix Them

1. **"Command not found"** → You misspelled the command, or the program isn't installed. Try `which commandname` to check if it exists, or `sudo apt install commandname` to install.
2. **"Permission denied"** → You need `sudo` (admin access) or the file isn't executable (use `chmod +x`).
3. **"No such file or directory"** → Check your current location with `pwd` and verify the path with `ls`. Typos in paths are the #1 cause.
4. **Accidentally edited a file you didn't mean to** → If using nano, `Ctrl+X` then `N` to exit without saving.
5. **Terminal seems frozen** → You might be in a program. Try `q`, then `Ctrl+C`, then `Ctrl+D`. As last resort, close and reopen the terminal.

#### Self-Test (answer without looking)
1. What command shows your current directory?
2. What's the difference between `>` and `>>`?
3. What does `chmod +x` do and why is it needed?
4. How do you search for text inside files?
5. What is the `~` shortcut?
6. Explain in your own words: what is an environment variable? Give a real-world analogy.
7. Why should you NEVER share your private SSH key?

#### Checkpoint: Mini-Challenge 🔧

**Do this without looking at the tasks above:**

1. Create a folder structure: `~/microbank-project/logs/2024/march`
2. Create a file in it called `deployment.log` with 5 lines of fake log entries (make them up)
3. Use `grep` to find a specific word in your log file
4. Make the log file read-only (no one can write to it) — hint: `chmod`
5. Find ALL `.md` files in your entire project

**Debugging exercise:** Someone tells you "I can't run my script, it says permission denied." Walk through the diagnostic steps you'd take.

#### Interview Angle
**Q: "How comfortable are you with Linux?"**
A: "I work in a Linux terminal daily. I'm comfortable navigating the file system, managing files and permissions, searching with grep and find, managing processes, and writing shell scripts. I use WSL2 on my Windows machine and have experience with Ubuntu."

**Q: "A deployment script isn't running. What do you check first?"**
A: "First I check file permissions with `ls -la` — does it have execute permission? Then I check if the script has the right shebang line (`#!/bin/bash`). Then I try running it with `bash script.sh` to see the actual error message. I also check if it's using the right line endings — Windows line endings can break Linux scripts."

---

### Phase 2: Git & GitHub/GitLab (Days 3-4)

**Goal:** Use Git to track changes, collaborate via branches and pull requests, and work with both GitHub and GitLab repositories.

**Why this matters for the job:** The JD specifically requires "Git si GitHub — gestionarea codului sursa (Version Control System)" AND "Gitlab CI/CD." You need to be fluent in both platforms. Every single change in an enterprise bank is tracked via Git.

**Tools & setup:**
```bash
# Install Git (probably already installed)
sudo apt install -y git

# Configure your identity (use the same email as your GitHub account)
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
git config --global init.defaultBranch main

# Add your SSH key to GitHub:
# 1. Copy your public key: cat ~/.ssh/id_ed25519.pub
# 2. Go to GitHub.com → Settings → SSH Keys → New SSH Key → paste it

# Add the SAME key to GitLab:
# 1. Go to GitLab.com → Preferences → SSH Keys → paste it
```

**⏱️ Total: ~14 hours across 2 days**

#### Concepts to Learn First

**What is version control?**
Imagine you're writing a document. You save `report_v1.docx`, then `report_v2.docx`, then `report_final.docx`, then `report_FINAL_FINAL.docx`. Version control (Git) does this automatically and intelligently. It tracks every change, who made it, when, and why. You can go back to any previous version.

**What is a repository (repo)?**
A folder tracked by Git. It contains your files AND the complete history of all changes.

**What is a commit?**
A snapshot of your files at a specific moment. Like a save point in a video game. Each commit has a message explaining what changed.

**What is a branch?**
A parallel version of your code. The `main` branch is the "official" version. You create branches to work on features without affecting `main`. When your work is done, you "merge" your branch back into `main`.

**What is a remote?**
A copy of your repository stored on a server (GitHub, GitLab). `push` sends your changes up; `pull` brings changes down.

**GitHub vs GitLab:**
Both host Git repositories. GitHub is the most popular for open source. GitLab has built-in CI/CD (pipelines). Most enterprises use one or both. The JD asks for experience with both.

#### Tasks

**Task 1: Initialize MicroBank repository** ⏱️ ~30 min

```bash
cd ~/microbank-project

# Initialize Git in this folder
git init
# Output: Initialized empty Git repository in /home/you/microbank-project/.git/

# Check status — what does Git see?
git status
# Shows all your files as "untracked" (Git sees them but isn't tracking them yet)

# Create .gitignore — tells Git which files to ignore
cat << 'EOF' > .gitignore
# Build artifacts
*.jar
*.class
target/

# Docker
.docker/

# Environment files with secrets
.env
*.secret

# OS files
.DS_Store
Thumbs.db

# IDE files
.idea/
.vscode/
*.swp
EOF

# Stage all files (tell Git "I want to include these in the next snapshot")
git add .

# Check status again
git status
# Now files show as "Changes to be staged" (green)

# Create your first commit
git commit -m "Initial project structure with architecture docs"

# View the commit history
git log
# Shows your commit with hash, author, date, message

# Shorter log view
git log --oneline
```

**Task 2: Push to GitHub** ⏱️ ~20 min

```bash
# 1. Go to GitHub.com → "+" → "New Repository"
#    Name: microbank-project
#    Description: "DevOps learning project - banking microservices"
#    Visibility: Public (or Private, your choice)
#    Do NOT initialize with README (you already have one)
#    Click "Create Repository"

# 2. Connect your local repo to GitHub
git remote add github git@github.com:YOUR-USERNAME/microbank-project.git

# 3. Push your code
git push -u github main
# -u = "set upstream" (remember this remote as the default)

# 4. Refresh GitHub.com — your files should appear!
```

**Task 3: Also push to GitLab** ⏱️ ~20 min

```bash
# 1. Go to GitLab.com → "+" → "New Project" → "Create blank project"
#    Name: microbank-project
#    Do NOT initialize with README

# 2. Add GitLab as a second remote
git remote add gitlab git@gitlab.com:YOUR-USERNAME/microbank-project.git

# 3. Push to GitLab
git push -u gitlab main

# 4. Verify — you now have the same code on both platforms!
git remote -v
# Shows both github and gitlab URLs
```

💡 **Why both?** The JD requires GitLab CI/CD but also wants GitHub experience. In practice, some companies use both — e.g., open-source code on GitHub, internal CI/CD on GitLab.

**Task 4: Branching workflow** ⏱️ ~60 min

```bash
# Create a new branch for a "feature"
git checkout -b feature/add-nginx-config
# checkout -b = create AND switch to a new branch
# Naming convention: feature/description, bugfix/description, hotfix/description

# Verify which branch you're on
git branch
# The * shows your current branch

# Create the Nginx configuration
cat << 'EOF' > nginx/nginx.conf
# Nginx reverse proxy configuration for MicroBank
# Routes API calls to the appropriate backend service

events {
    worker_connections 1024;    # Max simultaneous connections
}

http {
    # Upstream servers — where Nginx forwards requests
    upstream account_service {
        server account-service:8080;    # Docker service name + port
    }

    upstream transaction_service {
        server transaction-service:8081;
    }

    server {
        listen 80;                       # Nginx listens on port 80
        server_name localhost;

        # Route /api/accounts/* to Account Service
        location /api/accounts {
            proxy_pass http://account_service;
        }

        # Route /api/transactions/* to Transaction Service
        location /api/transactions {
            proxy_pass http://transaction_service;
        }

        # Health check endpoint
        location /health {
            return 200 'OK';
        }
    }
}
EOF

# Stage and commit
git add nginx/nginx.conf
git commit -m "Add Nginx reverse proxy configuration for MicroBank services"

# Push branch to GitHub
git push github feature/add-nginx-config
```

**Task 5: Pull Request / Merge Request** ⏱️ ~30 min

```bash
# On GitHub.com:
# 1. You'll see "feature/add-nginx-config had recent pushes — Compare & pull request"
# 2. Click "Compare & pull request"
# 3. Write a clear PR description:
#    Title: "Add Nginx reverse proxy configuration"
#    Description: "Adds nginx.conf that routes:
#    - /api/accounts → Account Service (port 8080)
#    - /api/transactions → Transaction Service (port 8081)
#    - /health → returns 200 OK"
# 4. Click "Create pull request"
# 5. Review the "Files changed" tab — see what you added
# 6. Click "Merge pull request" → "Confirm merge"

# Back in terminal, switch to main and pull the merged changes:
git checkout main
git pull github main

# Delete the feature branch (it's merged, no longer needed)
git branch -d feature/add-nginx-config
```

📝 **Documentation practice:** Notice how the PR description explains WHAT the change does and WHY. This is essential in enterprise environments. Every PR should be understandable by someone who didn't write the code.

**Task 6: Merge conflicts** ⏱️ ~45 min

```bash
# We'll deliberately create a conflict so you know how to handle one

# Create two branches that change the same file
git checkout -b branch-a
echo "# Modified by Branch A" >> docs/architecture.md
git add . && git commit -m "Branch A changes to architecture"

git checkout main
git checkout -b branch-b
echo "# Modified by Branch B" >> docs/architecture.md
git add . && git commit -m "Branch B changes to architecture"

# Merge branch-a into main (works fine — no conflict)
git checkout main
git merge branch-a

# Now try merging branch-b (CONFLICT!)
git merge branch-b
# Output: CONFLICT (content): Merge conflict in docs/architecture.md

# Open the file to see the conflict markers
cat docs/architecture.md
# You'll see:
# <<<<<<< HEAD
# # Modified by Branch A
# =======
# # Modified by Branch B
# >>>>>>> branch-b

# Fix it: edit the file to keep what you want
# Using nano (a simple text editor):
nano docs/architecture.md
# Remove the <<<<<<, ======, >>>>>> lines
# Keep both changes (or choose one)
# Save: Ctrl+O, Enter, Ctrl+X

# Mark conflict as resolved
git add docs/architecture.md
git commit -m "Merge branch-b, resolve conflict in architecture.md"

# Clean up
git branch -d branch-a
git branch -d branch-b
```

💡 **In enterprise banks:** Merge conflicts happen daily when multiple developers work on the same codebase. Knowing how to resolve them calmly is a fundamental skill.

**Task 7: Good commit messages** ⏱️ ~15 min

📝 Practice writing commit messages following the enterprise convention:

```
# BAD commit messages:
git commit -m "fix"
git commit -m "changes"
git commit -m "updated stuff"

# GOOD commit messages:
git commit -m "Fix Nginx proxy_pass URL for account service"
git commit -m "Add health check endpoint to Nginx config"
git commit -m "Update PostgreSQL port from 5432 to 5433 in dev config"

# GREAT commit messages (with ticket reference — common in banks):
git commit -m "JIRA-1234: Add Nginx reverse proxy configuration"
git commit -m "JIRA-1235: Fix database connection timeout in account service config"
```

**Task 8: Push final state to both remotes** ⏱️ ~10 min

```bash
git push github main
git push gitlab main
```

#### Common Mistakes & How to Fix Them

1. **"fatal: not a git repository"** → You're not inside a Git-tracked folder. `cd` to the right folder.
2. **"merge conflict" panic** → Don't panic. Open the file, look for `<<<<<<<`, decide what to keep, remove the markers, `git add`, `git commit`.
3. **Committed a secret/password** → Run `git reset HEAD~1` to undo the last commit (before pushing). If already pushed, the secret is compromised — rotate it immediately.
4. **Pushed to wrong branch** → Use `git revert` to create a new commit that undoes the change. Never use `git push --force` on shared branches.
5. **"Your branch is behind"** → Run `git pull` before `git push`. If you get a conflict, resolve it like Task 6.

#### Self-Test
1. What is the difference between `git add` and `git commit`?
2. Why do we use branches instead of committing directly to `main`?
3. Explain a merge conflict in your own words. How is it resolved?
4. What is the difference between a GitHub Pull Request and a GitLab Merge Request? (Trick question — they're the same concept, different names!)
5. Why should you write descriptive commit messages? Who reads them?
6. **Teach-back:** Explain to a non-technical colleague why version control matters. Use an analogy.

#### Checkpoint: Mini-Challenge 🔧

1. Create a new branch called `feature/add-database-config`
2. Create a file `database/init.sql` with some dummy SQL:
   ```sql
   CREATE TABLE accounts (
       id SERIAL PRIMARY KEY,
       name VARCHAR(100),
       balance DECIMAL(10,2)
   );
   ```
3. Commit it with a proper message
4. Push to BOTH GitHub and GitLab
5. Create a Pull Request on GitHub with a descriptive message
6. Merge it
7. Pull the changes to your local `main` branch

**Debugging exercise:** Your colleague says "I pushed my code but my teammate can't see it." What questions do you ask? (Hint: which branch? which remote? did they pull?)

#### Interview Angle
**Q: "Describe your Git workflow."**
A: "I follow a feature branch workflow. For each task, I create a branch from main — named like `feature/description` or `bugfix/description`. I make focused commits with clear messages referencing the ticket number. When done, I push and open a pull request for code review. After review and CI pipeline passes, it gets merged. I've used both GitHub and GitLab — the workflow is similar, though GitLab has built-in CI/CD which we used for our pipelines."

**Q: "How do you handle merge conflicts?"**
A: "Merge conflicts happen when two people change the same part of a file. Git marks the conflicting sections. I open the file, understand both changes, decide what the correct combined version should be, remove the conflict markers, and commit. I always communicate with the other developer to make sure we agree on the resolution."

---

### Phase 3: YAML & Bash Scripting Basics (Days 5-7)

**Goal:** Write valid YAML configuration files and Bash scripts that automate repetitive tasks.

**Why this matters for the job:** Every DevOps tool uses YAML for configuration — Docker Compose, Kubernetes, Ansible, GitLab CI, GitHub Actions. Bash scripts are how you automate deployments, health checks, and cleanup tasks. The JD requires you to "creezi scripturile pentru implementarea automata."

**Tools & setup:**
```bash
# Install YAML linter and jq (JSON processor)
sudo apt install -y python3-pip jq shellcheck
pip3 install yamllint --break-system-packages
```

**⏱️ Total: ~18 hours across 3 days**

#### Concepts to Learn First

**What is YAML?**
YAML = "YAML Ain't Markup Language." It's a human-readable format for configuration files. Think of it like a structured notepad. DevOps tools read YAML files to know what to do.

**What is Bash?**
Bash is the default command-line language on Linux. A Bash script is a text file containing a series of commands that run automatically. Instead of typing 20 commands one by one, you put them in a script and run it once.

**What is JSON?**
JSON (JavaScript Object Notation) is another structured data format, like YAML but with more punctuation. APIs typically return data in JSON. You'll often convert between YAML and JSON.

#### Tasks — YAML (Day 5)

**Task 1: YAML basics** ⏱️ ~60 min

```bash
cd ~/microbank-project
mkdir -p configs
```

Create this file (type it yourself — don't copy-paste the first time):

```yaml
# configs/microbank-config.yaml
# This is a YAML configuration file for MicroBank
# Comments start with #

# Simple key-value pairs (like "variable = value")
app_name: MicroBank
version: "1.0.0"          # Quotes are optional for strings, but required for versions
debug_mode: false          # Boolean values: true/false (no quotes!)

# A list (array) — each item starts with a dash
environments:
  - dev
  - sit
  - uat
  - prod

# A nested structure (dictionary inside dictionary)
database:
  host: localhost
  port: 5432               # Numbers don't need quotes
  name: microbank_db
  credentials:
    username: microbank_user
    password: changeme123    # In real life, NEVER put passwords in config files!

# Services configuration
services:
  account_service:
    port: 8080
    replicas: 2
    health_check: /actuator/health

  transaction_service:
    port: 8081
    replicas: 2
    health_check: /actuator/health

# Multi-line string (the | preserves line breaks)
description: |
  MicroBank is a simplified banking application
  used for DevOps learning purposes.
  It consists of two microservices and a PostgreSQL database.
```

```bash
# Validate your YAML
yamllint configs/microbank-config.yaml
# If no output → your YAML is valid!
# If errors → fix the indentation (YAML uses 2 spaces, NEVER tabs)
```

⚠️ **YAML gotchas:**
- Indentation MUST use spaces, not tabs. Use 2 spaces per level.
- `on` and `off` are treated as booleans (`true`/`false`) — quote them if you mean strings: `"on"`
- Version numbers like `1.0` are treated as floats — use quotes: `"1.0"`

**Task 2: YAML for Docker Compose (preview)** ⏱️ ~30 min

You'll use this in Week 2. For now, study the structure:

```yaml
# configs/docker-compose-preview.yaml
# This is a preview of what you'll build in Phase 5
# Study the structure — notice how YAML nests services, ports, volumes

version: "3.8"                    # Docker Compose file version

services:                         # Define each container
  postgres:                       # Service name
    image: postgres:15            # Docker image to use
    environment:                  # Environment variables
      POSTGRES_DB: microbank_db
      POSTGRES_USER: microbank_user
      POSTGRES_PASSWORD: changeme123
    ports:
      - "5432:5432"              # host_port:container_port
    volumes:
      - db_data:/var/lib/postgresql/data   # Persistent storage

  account-service:
    image: microbank/account-service:1.0
    environment:
      DB_HOST: postgres           # Uses Docker service name as hostname
      DB_PORT: 5432
    ports:
      - "8080:8080"
    depends_on:                   # Start order
      - postgres

volumes:                          # Named volumes
  db_data:                        # Will persist even if container is deleted
```

```bash
yamllint configs/docker-compose-preview.yaml
```

#### Tasks — Bash Scripting (Days 6-7)

**Task 3: Your first real script** ⏱️ ~45 min

```bash
# Create the script file
cat << 'SCRIPT' > scripts/setup-project.sh
#!/bin/bash
# =============================================================================
# setup-project.sh — Sets up the MicroBank project directories and configs
# Usage: ./scripts/setup-project.sh [environment]
# Example: ./scripts/setup-project.sh dev
# =============================================================================

# Safety settings:
# -e = exit immediately if a command fails
# -u = treat unset variables as errors
# -o pipefail = if any command in a pipe fails, the whole pipe fails
set -euo pipefail

# --- Variables ---
PROJECT_NAME="MicroBank"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')    # Current date/time for logging
ENV_NAME="${1:-dev}"                        # First argument, default "dev" if not provided

# --- Functions ---

# Log function: prints timestamped messages
log() {
    echo "[$TIMESTAMP] [INFO] $1"
}

# Error function: prints errors and exits
error() {
    echo "[$TIMESTAMP] [ERROR] $1" >&2    # >&2 sends output to stderr (error stream)
    exit 1
}

# --- Main Script ---

log "Setting up $PROJECT_NAME for environment: $ENV_NAME"

# Validate environment name
case "$ENV_NAME" in
    dev|sit|uat|prod)
        log "Valid environment: $ENV_NAME"
        ;;
    *)
        error "Invalid environment: $ENV_NAME. Must be: dev, sit, uat, or prod"
        ;;
esac

# Create environment-specific directories
DIRS=("configs/$ENV_NAME" "logs/$ENV_NAME" "backups/$ENV_NAME")

for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        log "Directory already exists: $dir"
    else
        mkdir -p "$dir"
        log "Created directory: $dir"
    fi
done

# Create environment config file
CONFIG_FILE="configs/$ENV_NAME/environment.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
    cat << EOF > "$CONFIG_FILE"
# MicroBank Configuration — $ENV_NAME environment
# Generated on: $TIMESTAMP

environment: $ENV_NAME
debug_mode: $([ "$ENV_NAME" = "dev" ] && echo "true" || echo "false")

database:
  host: postgres-$ENV_NAME
  port: 5432
  name: microbank_$ENV_NAME
EOF
    log "Created config file: $CONFIG_FILE"
else
    log "Config file already exists: $CONFIG_FILE"
fi

log "Setup complete for $ENV_NAME environment!"
SCRIPT

# Make the script executable
chmod +x scripts/setup-project.sh

# Run it for different environments
./scripts/setup-project.sh dev
./scripts/setup-project.sh sit
./scripts/setup-project.sh uat

# Try an invalid environment
./scripts/setup-project.sh invalid
# Should show ERROR and exit

# Verify the structure
tree configs/
```

✅ **Verification:** You should see `configs/dev/`, `configs/sit/`, `configs/uat/` each containing `environment.yaml`.

**Task 4: Script with loops and conditionals** ⏱️ ~45 min

```bash
cat << 'SCRIPT' > scripts/check-services.sh
#!/bin/bash
# =============================================================================
# check-services.sh — Checks if MicroBank services are reachable
# This script simulates what you'd run after a deployment
# Usage: ./scripts/check-services.sh
# =============================================================================

set -euo pipefail

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Define services to check (name:port pairs)
# In real life, these would be actual service URLs
SERVICES=(
    "account-service:8080"
    "transaction-service:8081"
    "nginx:80"
    "postgres:5432"
)

PASSED=0
FAILED=0

echo "========================================"
echo "  MicroBank Service Health Check"
echo "  Time: $TIMESTAMP"
echo "========================================"
echo ""

for service_entry in "${SERVICES[@]}"; do
    # Split the entry by ':'
    SERVICE_NAME="${service_entry%%:*}"     # Everything before the ':'
    SERVICE_PORT="${service_entry##*:}"     # Everything after the ':'

    echo -n "Checking $SERVICE_NAME (port $SERVICE_PORT)... "

    # Simulate a health check (in real life, we'd use curl or nc)
    # For now, we just check if the port number is valid
    if [[ "$SERVICE_PORT" =~ ^[0-9]+$ ]] && [ "$SERVICE_PORT" -gt 0 ] && [ "$SERVICE_PORT" -lt 65536 ]; then
        echo "✅ CONFIGURED (port valid)"
        PASSED=$((PASSED + 1))
    else
        echo "❌ INVALID PORT"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "========================================"
echo "  Results: $PASSED passed, $FAILED failed"
echo "========================================"

# Exit with error code if any failed
if [ "$FAILED" -gt 0 ]; then
    exit 1
fi
SCRIPT

chmod +x scripts/check-services.sh
./scripts/check-services.sh
```

**Task 5: Working with JSON using jq** ⏱️ ~30 min

```bash
# Create a sample JSON file (like what an API might return)
cat << 'EOF' > configs/services-status.json
{
  "application": "MicroBank",
  "environment": "dev",
  "services": [
    {
      "name": "account-service",
      "status": "running",
      "port": 8080,
      "version": "1.0.0"
    },
    {
      "name": "transaction-service",
      "status": "stopped",
      "port": 8081,
      "version": "1.0.0"
    }
  ],
  "database": {
    "host": "localhost",
    "port": 5432,
    "status": "running"
  }
}
EOF

# Read the whole file formatted nicely
jq '.' configs/services-status.json

# Get the application name
jq '.application' configs/services-status.json

# Get all service names
jq '.services[].name' configs/services-status.json

# Get only services that are "stopped"
jq '.services[] | select(.status == "stopped") | .name' configs/services-status.json

# Get the database port
jq '.database.port' configs/services-status.json
```

**Task 6: Text searching with grep** ⏱️ ~30 min

```bash
# Create a sample log file
cat << 'EOF' > logs/sample-app.log
2024-03-28 10:00:01 INFO  AccountService started on port 8080
2024-03-28 10:00:02 INFO  Connected to database postgres:5432
2024-03-28 10:01:15 WARN  Slow query detected: 2340ms
2024-03-28 10:02:30 ERROR Connection refused to transaction-service:8081
2024-03-28 10:02:31 ERROR Retry attempt 1 failed
2024-03-28 10:02:35 INFO  Retry attempt 2 succeeded
2024-03-28 10:05:00 INFO  Health check passed
2024-03-28 10:10:00 WARN  Memory usage above 80%
2024-03-28 10:15:00 ERROR OutOfMemoryError: Java heap space
2024-03-28 10:15:01 ERROR Service crashed, initiating restart
EOF

# Find all errors
grep "ERROR" logs/sample-app.log

# Count errors
grep -c "ERROR" logs/sample-app.log

# Find errors and warnings
grep -E "ERROR|WARN" logs/sample-app.log

# Show line numbers
grep -n "ERROR" logs/sample-app.log

# Find lines NOT containing INFO (invert match)
grep -v "INFO" logs/sample-app.log
```

**Task 7: Lint your scripts** ⏱️ ~15 min

```bash
# ShellCheck analyzes your scripts for common mistakes
shellcheck scripts/setup-project.sh
shellcheck scripts/check-services.sh
# Fix any warnings it finds
```

**Task 8: Commit all your work** ⏱️ ~10 min

```bash
cd ~/microbank-project
git add .
git commit -m "Add YAML configs, Bash scripts, and sample log files"
git push github main
git push gitlab main
```

#### Common Mistakes & How to Fix Them

1. **YAML indentation errors** → Use exactly 2 spaces. Never use tabs. Use `yamllint` to check.
2. **`$variable` not expanding in script** → You probably used single quotes `'...'` instead of double quotes `"..."`. Single quotes prevent variable expansion.
3. **"bad interpreter" error when running script** → The script has Windows line endings. Run `sed -i 's/\r$//' script.sh` to fix.
4. **"unbound variable" error** → You used `set -u` (good!) but referenced a variable that doesn't exist. Use `${VAR:-default}` for optional variables.
5. **jq syntax errors** → Remember: jq uses `.field` for objects and `.[0]` for arrays. Pipe with `|` inside the jq expression.

#### Self-Test
1. What's the difference between `|` and `>` in YAML multi-line strings?
2. Why is `version: 1.0` dangerous in YAML? How do you fix it?
3. What does `set -euo pipefail` do? Why do we use it in every script?
4. How do you extract a value from a JSON file in a Bash script?
5. What tool checks Bash scripts for common errors?
6. **Teach-back:** Explain to a non-technical person what a "script" is and why DevOps engineers write them. Use a cooking recipe analogy.

#### Checkpoint: Mini-Challenge 🔧

Modify `scripts/setup-project.sh` to also:
1. Create a `README.md` file in each environment directory with the environment name and creation date
2. Log all output to both the screen AND a log file at `logs/setup.log`
3. Add a `--dry-run` flag that shows what WOULD happen without actually creating anything

**Debugging exercise:** This YAML file has 3 errors. Find and fix them:

```yaml
services:
  account-service:
    port:8080
    replicas: 2
    environment:
      - DB_HOST: postgres
      DEBUG: true
    labels:
      	app: microbank
```

(Answers: 1. Missing space after `port:`, 2. Inconsistent list format under `environment`, 3. Tab character before `app`)

#### Interview Angle
**Q: "Show me a Bash script you've written."**
A: "I wrote automation scripts for our MicroBank project — a setup script that creates environment-specific directories and configs, and a health check script that validates services after deployment. Both use `set -euo pipefail` for safety, proper logging with timestamps, and handle errors gracefully. I can walk you through the logic."

---

**📝 End of Week 1 — Weekly Review Task:**
1. Update your SDLC diagram with tools you've learned (Git, Bash, YAML)
2. Re-read the JD and mark which skills you now have at a basic level
3. Write a 1-paragraph "week in review" in `docs/learning-journal.md`
4. Push everything to both GitHub and GitLab

---

## Week 2: Containerization

> This week's goal: Package MicroBank into Docker containers and run the entire application stack locally. By Friday, you'll type `docker compose up` and the whole banking system starts.

---

### Phase 4: Docker Fundamentals (Days 1-3)

**Goal:** Build Docker images for MicroBank services and understand the container lifecycle from build to run.

**Why this matters for the job:** The JD lists "Tehnologii de containerizare precum Docker" as a core requirement. Docker is how modern applications are packaged and deployed. Every company's CI/CD pipeline builds Docker images.

**Tools & setup:**
```bash
# Install Docker
# For Ubuntu/WSL2:
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Allow running Docker without sudo
sudo usermod -aG docker $USER
# Log out and back in (close and reopen terminal) for this to take effect

# Verify Docker works
docker run hello-world
# Should print "Hello from Docker!" among other output
```

**⏱️ Total: ~20 hours across 3 days**

#### Concepts to Learn First

**What is a container?**
Think of a container as a lightweight, portable box that contains everything an application needs to run: the code, libraries, settings, and even a mini operating system. It runs the same way everywhere — your laptop, a test server, or a production cloud server. This solves the classic "it works on my machine" problem.

**What is a Docker image?**
An image is the *blueprint* for a container. A container is a *running instance* of an image. Analogy: an image is like a recipe; a container is the actual meal you cooked from that recipe. You can cook (run) multiple meals (containers) from the same recipe (image).

**What is a Dockerfile?**
A Dockerfile is a text file with instructions for building an image. Each instruction creates a "layer" (like layers of a cake). Docker caches layers, so if nothing changed, it reuses the cached layer — making builds faster.

**What is a Docker registry?**
A registry is where images are stored and shared. Docker Hub is the most common public registry. Companies use private registries (like Artifactory — which is in the JD). You `push` images to a registry and `pull` them from it.

**What is Java? What is a JAR file? What is Maven?**
Since MicroBank is written in Java, you need to know these basics:
- **Java** is a programming language widely used in banking (because it's reliable and well-understood)
- **JAR** (Java ARchive) is a packaged Java application — like a `.zip` file containing all the compiled code. You run a JAR with `java -jar myapp.jar`
- **JDK** (Java Development Kit) is the toolset for *building* Java code
- **JRE** (Java Runtime Environment) is the minimum needed for *running* Java code — smaller than JDK
- **Maven** is a build tool — it downloads dependencies (libraries) and compiles Java source code into a JAR
- You don't need to write Java. You just need to know: "Maven builds Java code into a JAR, and Java runs the JAR."

**What is a multi-stage build?**
A Docker technique where you use one image to BUILD the application and a different, smaller image to RUN it. Think of it like a kitchen: you cook in a big messy kitchen (build stage) but serve the food on a clean small plate (runtime stage). The final image doesn't include the kitchen — just the food.

#### Tasks

**Task 1: Docker basics — run, stop, inspect** ⏱️ ~45 min

```bash
# Pull and run an Nginx web server container
docker run -d --name my-nginx -p 8080:80 nginx
# -d = run in background (detached)
# --name = give it a friendly name
# -p 8080:80 = map your port 8080 to container's port 80
# nginx = the image to use (pulled from Docker Hub)

# Verify it's running
docker ps
# Shows running containers with names, ports, status

# Visit http://localhost:8080 in your browser — you should see "Welcome to nginx!"

# View container logs
docker logs my-nginx

# Execute a command inside the running container
docker exec -it my-nginx bash
# You're now INSIDE the container. It's like a tiny Linux server.
ls /etc/nginx/
cat /etc/nginx/nginx.conf
exit    # Return to your host machine

# Inspect container details (JSON output)
docker inspect my-nginx | jq '.[0].NetworkSettings.IPAddress'

# Stop the container
docker stop my-nginx

# See stopped containers
docker ps -a

# Remove the container
docker rm my-nginx

# See which images are downloaded
docker images
```

✅ **Verification:** You ran a web server in a container and accessed it from your browser. That's what DevOps is about — running services in containers.

**Task 2: Write your first Dockerfile** ⏱️ ~45 min

```bash
mkdir -p ~/microbank-project/docker-practice
cd ~/microbank-project/docker-practice

# Create a simple HTML page
cat << 'EOF' > index.html
<!DOCTYPE html>
<html>
<head><title>MicroBank Status</title></head>
<body>
    <h1>MicroBank is Running!</h1>
    <p>Environment: Development</p>
    <p>Status: All services operational</p>
</body>
</html>
EOF

# Create a Dockerfile
cat << 'EOF' > Dockerfile
# Start from the official Nginx image (our "base" image)
FROM nginx:alpine

# Copy our custom HTML into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Document which port the container uses (informational)
EXPOSE 80

# No CMD needed — the nginx image already has one
EOF

# Build the image
docker build -t microbank-status:1.0 .
# -t = tag (name:version)
# . = build context (current directory)

# Run it
docker run -d --name status-page -p 8080:80 microbank-status:1.0

# Check it: visit http://localhost:8080
# Clean up
docker stop status-page && docker rm status-page
```

**Task 3: Write MicroBank Account Service Dockerfile** ⏱️ ~90 min

```bash
cd ~/microbank-project/services/account-service

# First, create a simple Spring Boot application simulator
# (In a real project, developers give you the source code)
# We'll create a minimal Java app structure

mkdir -p src/main/java/com/microbank/account
cat << 'EOF' > src/main/java/com/microbank/account/Application.java
package com.microbank.account;

// This is a simplified placeholder
// In real life, developers write this code
public class Application {
    public static void main(String[] args) {
        System.out.println("Account Service starting...");
    }
}
EOF

# Create a Maven build file (pom.xml)
cat << 'EOF' > pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.microbank</groupId>
    <artifactId>account-service</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
    </parent>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
    </dependencies>
</project>
EOF

# Now create the Dockerfile with multi-stage build
cat << 'DOCKERFILE' > Dockerfile
# =============================================================================
# MicroBank Account Service — Multi-stage Dockerfile
# =============================================================================

# --- STAGE 1: BUILD ---
# Use a JDK image (has Maven + Java compiler) to build the application
FROM maven:3.9-eclipse-temurin-21 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven config first (for better layer caching)
# If pom.xml hasn't changed, Docker reuses this cached layer
COPY pom.xml .

# Download dependencies (cached if pom.xml unchanged)
RUN mvn dependency:go-offline -B

# Now copy the source code
COPY src ./src

# Build the JAR file (skip tests for faster builds)
RUN mvn package -DskipTests -B

# --- STAGE 2: RUN ---
# Use a minimal JRE image (no compiler, no Maven — much smaller)
FROM eclipse-temurin:21-jre-alpine

# Security: don't run as root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy ONLY the built JAR from the builder stage (not the whole build environment)
COPY --from=builder /app/target/*.jar app.jar

# Switch to non-root user
USER appuser

# Document the port
EXPOSE 8080

# Health check — Docker will periodically check if the app is alive
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Start the application
# Java apps typically need memory settings in containers
CMD ["java", "-Xmx512m", "-Xms256m", "-jar", "app.jar"]
DOCKERFILE

# Create .dockerignore (like .gitignore but for Docker)
cat << 'EOF' > .dockerignore
.git
*.md
.gitignore
target/
.idea/
EOF
```

💡 **Why multi-stage?** The build stage image with Maven + JDK is ~800MB. The final image with just JRE + our JAR is ~200MB. In production, smaller images = faster deployments and less attack surface.

**Task 4: Write Transaction Service Dockerfile** ⏱️ ~30 min

```bash
cd ~/microbank-project/services/transaction-service

# Create the same structure (simplified for learning)
mkdir -p src/main/java/com/microbank/transaction

# Copy and adapt from account-service
cp ../account-service/pom.xml .
# Edit the artifactId to "transaction-service" using sed:
sed -i 's/account-service/transaction-service/g' pom.xml

cp ../account-service/Dockerfile .
# Edit the port to 8081:
sed -i 's/8080/8081/g' Dockerfile

cp ../account-service/.dockerignore .

# Create placeholder source
cat << 'EOF' > src/main/java/com/microbank/transaction/Application.java
package com.microbank.transaction;
public class Application {
    public static void main(String[] args) {
        System.out.println("Transaction Service starting...");
    }
}
EOF
```

**Task 5: Nginx Dockerfile** ⏱️ ~30 min

```bash
cd ~/microbank-project/nginx

# Create custom Nginx Dockerfile
cat << 'DOCKERFILE' > Dockerfile
# MicroBank Nginx — API Gateway / Reverse Proxy
FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/nginx.conf

# Non-root user (nginx image supports this)
# Note: port 80 requires root, so we use 8080
RUN sed -i 's/listen 80/listen 8080/g' /etc/nginx/nginx.conf || true

EXPOSE 8080

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1
DOCKERFILE
```

**Task 6: Understanding Docker image layers** ⏱️ ~30 min

```bash
cd ~/microbank-project

# Build the Nginx image (it's simplest and will actually build)
cd nginx
docker build -t microbank/nginx:1.0 .

# See the build layers
docker history microbank/nginx:1.0

# Check image size
docker images microbank/nginx:1.0
# Should be very small (~40MB) since it's based on alpine

# Tag for different "environments" (preview of artifact promotion)
docker tag microbank/nginx:1.0 microbank/nginx:dev
docker tag microbank/nginx:1.0 microbank/nginx:latest
docker images | grep microbank
```

**Task 7: Commit everything** ⏱️ ~10 min

```bash
cd ~/microbank-project
git add .
git commit -m "Add Dockerfiles for all MicroBank services (multi-stage builds)"
git push github main
git push gitlab main
```

#### Common Mistakes & How to Fix Them

1. **"Cannot connect to the Docker daemon"** → Docker service isn't running. Try `sudo systemctl start docker` or restart WSL2.
2. **Build fails at "COPY src"** → Your file structure doesn't match what the Dockerfile expects. Check with `ls` and compare to the COPY instruction.
3. **Image is huge (>1GB)** → You're not using multi-stage build or you're based on a large image. Use `alpine` variants and multi-stage builds.
4. **Container exits immediately** → Check logs: `docker logs container-name`. The application inside probably crashed. Common cause: missing environment variables.
5. **"Port already in use"** → Another container or program is using that port. Find it with `docker ps` or `lsof -i :8080` and stop it.

#### Self-Test
1. What's the difference between a Docker image and a container?
2. Why do we use multi-stage builds? What problem do they solve?
3. What does `COPY --from=builder` do?
4. Why should containers run as non-root users?
5. What is a `.dockerignore` file for?
6. If a Dockerfile starts with `FROM maven:3.9` and then has `FROM eclipse-temurin:21-jre`, what's in the final image — Maven or just JRE?
7. **Teach-back:** Explain Docker to a non-technical colleague using an analogy.

#### Checkpoint: Mini-Challenge 🔧

**Debugging exercise:** This Dockerfile has 3 problems. Find and fix them:

```dockerfile
FROM nginx:latest
COPY nginx.conf /etc/nginx/
COPY index.html /usr/share/nginx/html
RUN echo "Starting nginx"
EXPOSE 80
CMD nginx -g "daemon on;"
```

(Hints: daemon directive is wrong for containers, missing file extension, and the RUN statement won't do what they expect at runtime.)

#### Interview Angle
**Q: "Explain Docker in simple terms."**
A: "Docker lets you package an application with everything it needs into a container — the code, libraries, and configuration. This container runs the same way on any machine. It solves the 'works on my machine' problem because the environment is consistent everywhere."

**Q: "What is a multi-stage Docker build?"**
A: "It's when you use one image to build your application and a different, smaller image to run it. For example, you need the full JDK and Maven to compile Java code, but to run it you only need the JRE. Multi-stage builds let you compile in a large build image but produce a small final image with just the runtime and your JAR."

---

### Phase 5: Docker Compose & Networking (Days 4-7)

**Goal:** Run the entire MicroBank stack (database + services + proxy) as a multi-container application with Docker Compose.

**Why this matters for the job:** Real applications are multiple containers working together. Docker Compose defines multi-container applications in a single YAML file. This is the foundation before you move to Kubernetes.

**Tools & setup:** Docker Compose is included with Docker (as `docker compose` plugin).

**⏱️ Total: ~24 hours across 4 days**

#### Concepts to Learn First

**What is Docker Compose?**
Docker Compose lets you define and run multi-container applications. Instead of running each container separately with long `docker run` commands, you define everything in a `docker-compose.yml` file and start the whole stack with one command.

**What is Docker networking?**
Containers need to talk to each other. Docker creates virtual networks. Containers on the same network can reach each other by service name (like DNS). Container `account-service` can connect to `postgres` just by using the hostname `postgres`.

**What are Docker volumes?**
Containers are temporary — when a container is deleted, its data is lost. Volumes let you persist data outside the container. Critical for databases: you don't want to lose all bank account data when a container restarts!

#### Tasks

**Task 1: Docker Compose for MicroBank** ⏱️ ~90 min

```bash
cd ~/microbank-project

# Create the main docker-compose file
cat << 'COMPOSE' > docker-compose.yml
# =============================================================================
# MicroBank — Docker Compose Configuration
# Run with: docker compose up -d
# Stop with: docker compose down
# =============================================================================

version: "3.8"

services:
  # --- DATABASE ---
  postgres:
    image: postgres:15-alpine          # Official PostgreSQL image (alpine = small)
    container_name: microbank-db
    environment:
      POSTGRES_DB: microbank           # Create this database on first start
      POSTGRES_USER: microbank_user    # Create this user
      POSTGRES_PASSWORD: ${DB_PASSWORD:-changeme123}  # From .env or default
    ports:
      - "5432:5432"                    # Expose for local dev tools
    volumes:
      - db_data:/var/lib/postgresql/data   # Persistent data storage
      - ./database/init.sql:/docker-entrypoint-initdb.d/init.sql  # Run on first start
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U microbank_user -d microbank"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - microbank-network

  # --- ACCOUNT SERVICE ---
  account-service:
    image: microbank/account-service:dev
    build:
      context: ./services/account-service   # Path to Dockerfile
      dockerfile: Dockerfile
    container_name: microbank-account
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/microbank
      SPRING_DATASOURCE_USERNAME: microbank_user
      SPRING_DATASOURCE_PASSWORD: ${DB_PASSWORD:-changeme123}
      SERVER_PORT: 8080
    ports:
      - "8080:8080"
    depends_on:
      postgres:
        condition: service_healthy    # Wait for DB to be ready
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:8080/actuator/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 60s              # Java apps need time to start
    networks:
      - microbank-network

  # --- TRANSACTION SERVICE ---
  transaction-service:
    image: microbank/transaction-service:dev
    build:
      context: ./services/transaction-service
      dockerfile: Dockerfile
    container_name: microbank-transaction
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/microbank
      SPRING_DATASOURCE_USERNAME: microbank_user
      SPRING_DATASOURCE_PASSWORD: ${DB_PASSWORD:-changeme123}
      SERVER_PORT: 8081
    ports:
      - "8081:8081"
    depends_on:
      postgres:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:8081/actuator/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 60s
    networks:
      - microbank-network

  # --- NGINX REVERSE PROXY ---
  nginx:
    image: microbank/nginx:dev
    build:
      context: ./nginx
      dockerfile: Dockerfile
    container_name: microbank-nginx
    ports:
      - "80:80"                        # Main entry point
    depends_on:
      - account-service
      - transaction-service
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:80/health"]
      interval: 15s
      timeout: 3s
      retries: 3
    networks:
      - microbank-network

# Named volumes — persist data across container restarts
volumes:
  db_data:
    driver: local

# Custom network — all services can communicate by service name
networks:
  microbank-network:
    driver: bridge
COMPOSE
```

**Task 2: Create environment variables file** ⏱️ ~15 min

```bash
# Create .env file for sensitive values
cat << 'EOF' > .env
# MicroBank Environment Configuration
# WARNING: Never commit this file to Git!
DB_PASSWORD=microbank_secure_2024
EOF

# Verify .env is in .gitignore
grep ".env" .gitignore || echo ".env" >> .gitignore
```

**Task 3: Create database initialization script** ⏱️ ~20 min

```bash
cat << 'EOF' > database/init.sql
-- MicroBank Database Initialization
-- This script runs automatically when PostgreSQL starts for the first time

-- Accounts table
CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    holder_name VARCHAR(100) NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0.00,
    currency VARCHAR(3) DEFAULT 'RON',
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    from_account VARCHAR(20),
    to_account VARCHAR(20),
    amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'RON',
    type VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'COMPLETED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO accounts (account_number, holder_name, balance) VALUES
    ('RO001', 'Maria Popescu', 15000.00),
    ('RO002', 'Ion Ionescu', 8500.50),
    ('RO003', 'Ana Gheorghe', 22000.00);

INSERT INTO transactions (from_account, to_account, amount, type) VALUES
    ('RO001', 'RO002', 500.00, 'TRANSFER'),
    ('RO003', 'RO001', 1200.00, 'TRANSFER');
EOF
```

**Task 4: Start the stack (database only first)** ⏱️ ~30 min

```bash
cd ~/microbank-project

# Start just PostgreSQL first to verify it works
docker compose up -d postgres

# Check if it's running and healthy
docker compose ps
# Should show postgres as "healthy" after ~10-15 seconds

# Check logs
docker compose logs postgres

# Connect to the database and verify data
docker exec -it microbank-db psql -U microbank_user -d microbank

# Inside psql (the PostgreSQL prompt):
SELECT * FROM accounts;
# Should show the 3 sample accounts
SELECT * FROM transactions;
# Should show the 2 sample transactions
\q
# Exits psql
```

✅ **Verification:** You can see the MicroBank accounts and transactions in the database. The data was loaded from your `init.sql` file automatically!

**Task 5: Container debugging practice** ⏱️ ~60 min

```bash
# These are common debugging techniques you'll use daily

# View logs from a specific service
docker compose logs -f postgres
# -f = "follow" (live streaming, like tail -f). Press Ctrl+C to stop.

# Execute commands inside a running container
docker exec -it microbank-db bash
# Now you're inside the container
cat /etc/os-release    # See what OS the container uses
ls /var/lib/postgresql/data/    # See where data is stored
exit

# Inspect networking
docker network ls
docker network inspect microbank-project_microbank-network

# Check resource usage
docker stats --no-stream

# View detailed container info
docker inspect microbank-db | jq '.[0].State'
```

**Task 6: Write a deployment helper script** ⏱️ ~45 min

```bash
cat << 'SCRIPT' > scripts/deploy-local.sh
#!/bin/bash
# =============================================================================
# deploy-local.sh — Builds and deploys MicroBank locally via Docker Compose
# Usage: ./scripts/deploy-local.sh [up|down|restart|status|logs]
# =============================================================================

set -euo pipefail

COMPOSE_FILE="docker-compose.yml"
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

log() { echo "[$TIMESTAMP] $1"; }
error() { echo "[$TIMESTAMP] ERROR: $1" >&2; exit 1; }

cd "$PROJECT_DIR"

case "${1:-status}" in
    up)
        log "Starting MicroBank stack..."
        docker compose -f "$COMPOSE_FILE" up -d --build
        log "Waiting for services to be healthy..."
        sleep 10
        docker compose ps
        log "MicroBank is running!"
        ;;
    down)
        log "Stopping MicroBank stack..."
        docker compose -f "$COMPOSE_FILE" down
        log "MicroBank stopped."
        ;;
    restart)
        log "Restarting MicroBank stack..."
        docker compose -f "$COMPOSE_FILE" down
        docker compose -f "$COMPOSE_FILE" up -d --build
        log "MicroBank restarted."
        ;;
    status)
        docker compose -f "$COMPOSE_FILE" ps
        ;;
    logs)
        docker compose -f "$COMPOSE_FILE" logs -f --tail=50
        ;;
    *)
        echo "Usage: $0 {up|down|restart|status|logs}"
        exit 1
        ;;
esac
SCRIPT

chmod +x scripts/deploy-local.sh
```

**Task 7: Test and commit** ⏱️ ~20 min

```bash
# Test the deploy script
./scripts/deploy-local.sh status

# Clean up
docker compose down

# Commit
cd ~/microbank-project
git add .
git commit -m "Add Docker Compose stack with PostgreSQL, services, and deploy script"
git push github main
git push gitlab main
```

#### Common Mistakes & How to Fix Them

1. **"port is already allocated"** → A previous container is still using that port. Run `docker compose down` or `docker ps` to find and stop it.
2. **Container keeps restarting** → Check logs: `docker compose logs servicename`. Usually a wrong environment variable or the dependent service isn't ready yet.
3. **Database data disappears after restart** → You're using `docker compose down -v` which deletes volumes. Use `docker compose down` (without `-v`) to keep data.
4. **Services can't connect to postgres** → Make sure they're on the same network in docker-compose.yml AND using `postgres` (the service name) as the hostname, not `localhost`.
5. **Changes to Dockerfile not reflected** → You need `docker compose up -d --build` (with `--build` flag) to rebuild images.

#### Self-Test
1. What's the difference between `docker compose up` and `docker compose up --build`?
2. Why do we use `depends_on` with `condition: service_healthy`?
3. What happens to database data when you run `docker compose down`? What about `docker compose down -v`?
4. How do containers find each other by name? (Hint: Docker DNS)
5. Why do we put passwords in `.env` instead of directly in `docker-compose.yml`?
6. What is a Docker volume and why is it critical for a database?

#### Checkpoint: Mini-Challenge 🔧

1. Add a resource limit to the PostgreSQL container (max 512MB memory, 0.5 CPU)
2. Add a new service to docker-compose.yml: `adminer` (a web-based database admin tool, image: `adminer:latest`, port 8888)
3. Verify you can access Adminer at http://localhost:8888 and connect to the database

**Debugging exercise:** Your colleague says "I ran `docker compose up` but account-service keeps crashing." Walk through your diagnostic steps.

#### Interview Angle
**Q: "How do you run a multi-container application locally?"**
A: "I use Docker Compose. I define all services in a `docker-compose.yml` — the database, application services, and reverse proxy. Each has its own configuration: environment variables for secrets, health checks for readiness, volumes for persistent data, and they communicate over a Docker bridge network using service names as hostnames."

**Q: "How do you debug a container that won't start?"**
A: "First, `docker compose logs servicename` to see the error. Then `docker compose ps` to check the status. Common issues are wrong environment variables, missing config files, or the container running out of memory. I check `docker inspect` for detailed state and `docker stats` for resource usage."

---

**📝 End of Week 2 — Weekly Review Task:**
1. Update your SDLC diagram (add Docker in the Build/Deploy stages)
2. Write a summary: "How Docker helps in the SDLC" (3-5 sentences) in your journal
3. Push everything to both remotes

---

## Week 3: CI/CD Pipelines

> This week's goal: Build an automated pipeline that builds, tests, and deploys MicroBank every time you push code. By Friday, pushing to GitLab triggers a pipeline that builds Docker images and runs checks automatically.

---

### Phase 6: GitLab CI/CD — Your First Pipeline (Days 1-4)

**Goal:** Build a multi-stage CI/CD pipeline in GitLab that automatically lints, builds, tests, and packages MicroBank on every code push.

**Why this matters for the job:** The JD's #1 listed skill is "Gitlab CI/CD." Building and maintaining CI/CD pipelines is likely your primary daily activity. The JD also says "Intelegi diferitele instrumente de dezvoltare a CI/CD digital pipelines" and "Implementezi DevOps și realizezi automatizarea."

**Tools & setup:**
```bash
# You already have a GitLab account and the project pushed there
# We need to set up a GitLab Runner (the machine that executes pipeline jobs)

# Install GitLab Runner
sudo curl -L --output /usr/local/bin/gitlab-runner \
    https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo gitlab-runner install --user=$USER --working-directory=$HOME/gitlab-runner
sudo gitlab-runner start

# Register the runner with your GitLab project:
# 1. Go to GitLab → Your project → Settings → CI/CD → Runners → Expand
# 2. Click "New project runner"
# 3. Copy the registration token
# 4. Run:
sudo gitlab-runner register
# URL: https://gitlab.com/
# Token: (paste from GitLab)
# Description: microbank-local-runner
# Tags: docker,local
# Executor: docker
# Default Docker image: ubuntu:22.04
```

**⏱️ Total: ~28 hours across 4 days**

#### Concepts to Learn First

**What is CI/CD?**
- **CI (Continuous Integration):** Every time a developer pushes code, it's automatically built and tested. Catches bugs early.
- **CD (Continuous Delivery):** After CI passes, the application is automatically prepared for deployment. A human clicks "deploy."
- **CD (Continuous Deployment):** Like Continuous Delivery but fully automatic — no human approval needed. (Banks rarely use this for production.)

**What is a pipeline?**
A series of automated steps. Example: `lint → build → test → package → deploy`. Each step is a "job," groups of jobs at the same level form a "stage." If any stage fails, the pipeline stops.

**What is a Runner?**
A machine (or container) that executes the pipeline jobs. GitLab sends instructions to the Runner, the Runner does the work and reports back. Think of GitLab as the manager and the Runner as the worker.

**What are pipeline stages?**
Stages run in order. Jobs within the same stage run in parallel. Example:
```
Stage: lint        → [yamllint job] [shellcheck job] (run at the same time)
Stage: build       → [build-account job] [build-transaction job] (run at the same time)
Stage: test        → [integration-test job]
Stage: package     → [push-images job]
Stage: deploy      → [deploy-staging job] (manual approval)
```

**What is a GitLab Container Registry?**
GitLab provides a free Docker registry for each project. You can push your Docker images there, just like Docker Hub but private and integrated with your pipeline.

#### Tasks

**Task 1: Your first pipeline — Hello CI** ⏱️ ~45 min

```bash
cd ~/microbank-project

# Create the GitLab CI config file
cat << 'EOF' > .gitlab-ci.yml
# =============================================================================
# MicroBank CI/CD Pipeline
# This file tells GitLab what to do when you push code
# =============================================================================

# Define the stages (run in this order)
stages:
  - validate
  - build
  - test
  - package
  - deploy

# --- VALIDATE STAGE ---
# Check that config files and scripts are valid
yamllint:
  stage: validate
  image: python:3.11-slim                    # Use this Docker image for the job
  before_script:
    - pip install yamllint --quiet            # Install yamllint
  script:
    - echo "Checking YAML files..."
    - yamllint -d relaxed configs/            # Lint all YAML in configs/
    - yamllint -d relaxed docker-compose.yml  # Lint the compose file
    - echo "All YAML files are valid!"

shellcheck:
  stage: validate
  image: koalaman/shellcheck-alpine:latest
  script:
    - echo "Checking Bash scripts..."
    - shellcheck scripts/*.sh                 # Lint all shell scripts
    - echo "All scripts passed ShellCheck!"

# --- BUILD STAGE ---
# Build Docker images
build-nginx:
  stage: build
  image: docker:24
  services:
    - docker:24-dind                          # Docker-in-Docker (allows building images)
  variables:
    DOCKER_TLS_CERTDIR: "/certs"
  script:
    - echo "Building Nginx image..."
    - docker build -t microbank/nginx:$CI_COMMIT_SHORT_SHA ./nginx
    - echo "Nginx image built successfully!"
  # Only run on main branch and merge requests
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
    - if: $CI_MERGE_REQUEST_ID

# --- TEST STAGE ---
test-compose-config:
  stage: test
  image: docker:24
  services:
    - docker:24-dind
  script:
    - echo "Validating Docker Compose configuration..."
    - docker compose config                   # Validate compose file
    - echo "Docker Compose configuration is valid!"

# --- PACKAGE STAGE ---
# Push images to GitLab Container Registry
package-nginx:
  stage: package
  image: docker:24
  services:
    - docker:24-dind
  variables:
    DOCKER_TLS_CERTDIR: "/certs"
  before_script:
    # Login to GitLab Container Registry
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
  script:
    - docker build -t $CI_REGISTRY_IMAGE/nginx:$CI_COMMIT_SHORT_SHA ./nginx
    - docker push $CI_REGISTRY_IMAGE/nginx:$CI_COMMIT_SHORT_SHA
    # Also tag as "latest" for main branch
    - docker tag $CI_REGISTRY_IMAGE/nginx:$CI_COMMIT_SHORT_SHA $CI_REGISTRY_IMAGE/nginx:latest
    - docker push $CI_REGISTRY_IMAGE/nginx:latest
  rules:
    - if: $CI_COMMIT_BRANCH == "main"

# --- DEPLOY STAGE ---
deploy-staging:
  stage: deploy
  image: alpine:latest
  script:
    - echo "Deploying to staging environment..."
    - echo "Image: $CI_REGISTRY_IMAGE/nginx:$CI_COMMIT_SHORT_SHA"
    - echo "Staging deployment complete!"
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
      when: manual                             # Requires manual click to deploy
      allow_failure: false                     # Pipeline waits for approval
  environment:
    name: staging
    url: https://staging.microbank.example.com
EOF

# Commit and push to GitLab
git add .gitlab-ci.yml
git commit -m "Add GitLab CI/CD pipeline with validate, build, test, package, deploy stages"
git push gitlab main
```

💡 **After pushing:** Go to GitLab → Your project → CI/CD → Pipelines. You should see a pipeline running! Watch it go through each stage.

**Task 2: Add CI/CD variables for secrets** ⏱️ ~15 min

```
# In GitLab:
# 1. Go to Settings → CI/CD → Variables → Expand
# 2. Add these variables:
#    Key: DB_PASSWORD    Value: microbank_secure_2024    Type: Variable    Masked: Yes
#    Key: DEPLOY_KEY     Value: staging-deploy-2024      Type: Variable    Masked: Yes
#
# "Masked" means the value is hidden in pipeline logs (shown as [MASKED])
# "Protected" means only available on protected branches (main)
```

📝 **Documentation practice:** In enterprise banks, every CI/CD variable is documented. Write a note in `docs/ci-cd-variables.md` listing each variable, its purpose, and who owns it:

```bash
cat << 'EOF' > docs/ci-cd-variables.md
# MicroBank CI/CD Variables

| Variable | Purpose | Masked | Protected | Owner |
|----------|---------|--------|-----------|-------|
| DB_PASSWORD | Database password for staging | Yes | Yes | DevOps Team |
| DEPLOY_KEY | Staging deployment key | Yes | Yes | DevOps Team |
| CI_REGISTRY_USER | Auto-provided by GitLab | - | - | GitLab |
| CI_REGISTRY_PASSWORD | Auto-provided by GitLab | - | - | GitLab |
EOF
```

**Task 3: Add pipeline caching** ⏱️ ~20 min

Add this to the top of your `.gitlab-ci.yml` (after `stages:`):

```yaml
# Global cache configuration
# Caching stores downloaded dependencies between pipeline runs
# This makes pipelines faster — don't re-download everything each time
default:
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - .m2/repository              # Maven dependencies (Java)
      - node_modules/               # Node.js dependencies (if any)
```

**Task 4: Add pipeline for feature branches** ⏱️ ~30 min

```bash
# Create a feature branch and push it
git checkout -b feature/add-health-endpoint

# Make a small change
echo "# Health check endpoint added" >> docs/architecture.md
git add .
git commit -m "FEAT: Add documentation for health check endpoint"
git push gitlab feature/add-health-endpoint

# Go to GitLab — you'll see a pipeline for this branch
# Note: only validate and build stages run (no package/deploy)
# This is because of the 'rules:' we set
```

**Task 5: GitHub Actions — basic equivalent** ⏱️ ~45 min

The JD wants GitHub experience too. Let's add a simple GitHub Actions pipeline:

```bash
cd ~/microbank-project
git checkout main
git pull gitlab main

mkdir -p .github/workflows

cat << 'EOF' > .github/workflows/ci.yml
# =============================================================================
# MicroBank GitHub Actions CI Pipeline
# Runs on every push and pull request
# =============================================================================

name: MicroBank CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Lint YAML files
        run: |
          pip install yamllint
          yamllint -d relaxed configs/ || true
          yamllint -d relaxed docker-compose.yml || true

      - name: Lint Shell scripts
        run: |
          sudo apt-get install -y shellcheck
          shellcheck scripts/*.sh || true

  build:
    runs-on: ubuntu-latest
    needs: validate                    # Only runs if validate passes
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Build Nginx image
        run: docker build -t microbank/nginx:test ./nginx

      - name: Validate Docker Compose
        run: docker compose config
EOF

git add .
git commit -m "Add GitHub Actions CI pipeline alongside GitLab CI"
git push github main
git push gitlab main
```

💡 **Notice the differences:** GitLab CI uses `.gitlab-ci.yml` with `stages:` and `script:`. GitHub Actions uses `.github/workflows/ci.yml` with `jobs:` and `steps:`. Same concept, different syntax. Being fluent in both makes you more valuable.

**Task 6: Understand pipeline artifacts and reports** ⏱️ ~20 min

Add to your `.gitlab-ci.yml` validate stage:

```yaml
# Add this to the shellcheck job
  artifacts:
    reports:
      junit: shellcheck-report.xml       # Test report format GitLab understands
    when: always                          # Save artifacts even if job fails
    expire_in: 1 week                    # Auto-delete after 1 week
```

#### Common Mistakes & How to Fix Them

1. **Pipeline stuck on "pending"** → No Runner is available or online. Check Settings → CI/CD → Runners.
2. **"yaml invalid" error** → Your `.gitlab-ci.yml` has a syntax error. Use GitLab's CI Lint tool: CI/CD → Editor → Validate.
3. **Docker build fails in pipeline but works locally** → The CI environment is different. Check which base image the job uses and ensure files are available in the correct context.
4. **"Permission denied" in pipeline** → The Runner doesn't have permission. Check the Docker socket access and service configuration.
5. **Variables not accessible** → Check if the variable is "Protected" but you're running on an unprotected branch.

#### Self-Test
1. What's the difference between CI and CD?
2. Explain the relationship between stages, jobs, and pipelines.
3. Why do we mask CI/CD variables?
4. What is a GitLab Runner and why is it needed?
5. What is the `rules:` keyword used for?
6. How is GitHub Actions different from GitLab CI? (Structure, naming, where the config file lives)
7. **Teach-back:** Explain to a project manager why CI/CD pipelines are important. What problems do they solve?

#### Checkpoint: Mini-Challenge 🔧

1. Add a new stage `security-scan` between `test` and `package` that runs `docker scan` (or Trivy) on the Nginx image
2. Configure the pipeline so that security scan failures are warnings (don't block the pipeline) but are visible in the pipeline UI
3. Add a merge request pipeline: when someone opens a Merge Request, only `validate` and `build` stages run

**Debugging exercise:** A pipeline shows this error: `$ docker build -t microbank/nginx . — error: COPY failed: file not found in build context`. What's the likely cause?

#### Interview Angle
**Q: "Describe a CI/CD pipeline you've built."**
A: "I built a multi-stage pipeline for MicroBank, a microservices banking application. The pipeline has five stages: validate (linting YAML and shell scripts), build (Docker images for each service), test (integration tests), package (push images to a registry), and deploy (with manual approval for staging). Feature branches only run validate and build. The main branch runs the full pipeline. I've implemented the same pipeline in both GitLab CI and GitHub Actions."

**Q: "How do you handle secrets in CI/CD?"**
A: "Secrets are stored as masked CI/CD variables in the pipeline settings — never in the code repository. They're marked as 'masked' so they don't appear in pipeline logs, and 'protected' so they're only available on protected branches. In the pipeline YAML, we reference them as environment variables."

---

### Phase 7: Automation Scripts & Delivery Management (Days 5-7)

**Goal:** Write production-quality automation scripts and practice the software delivery management process with approvals and documentation.

**Why this matters for the job:** The JD says "creezi scripturile pentru implementarea automata" AND "efectuezi pasii de management ai procesului de livrare a software-ului, asigurandu-te ca toate cerintele (inclusiv aprobarile) sunt indeplinite."

**Tools & setup:** Already installed.

**⏱️ Total: ~18 hours across 3 days**

#### Concepts to Learn First

**What is software delivery management?**
The process of moving software from development to production. In enterprise banks, this isn't just "push code." It involves:
1. **Change Request (CR)** — a formal document requesting a change
2. **Approval gates** — Dev Lead, QA Lead, Release Manager must approve
3. **Environment promotion** — move from DEV → SIT → UAT → PROD
4. **Deployment window** — changes only deployed during approved times
5. **Rollback plan** — what to do if deployment fails
6. **Post-deployment verification** — confirm everything works after deploy

**What is a runbook?**
A step-by-step guide for performing an operational task. Written so that ANY team member can follow it, even at 3 AM during an incident. Banks require runbooks for every deployment.

#### Tasks

**Task 1: Health check script with retry logic** ⏱️ ~45 min

```bash
cat << 'SCRIPT' > scripts/health-check.sh
#!/bin/bash
# =============================================================================
# health-check.sh — Checks if a service is healthy with retry logic
# Usage: ./scripts/health-check.sh <url> [max_retries] [wait_seconds]
# Example: ./scripts/health-check.sh http://localhost:8080/health 5 10
# =============================================================================

set -euo pipefail

# --- Arguments with defaults ---
URL="${1:?Usage: $0 <url> [max_retries] [wait_seconds]}"
MAX_RETRIES="${2:-5}"          # Default: 5 retries
WAIT_SECONDS="${3:-10}"        # Default: 10 seconds between retries
TIMEOUT=5                     # curl timeout in seconds

# --- Logging ---
log()   { echo "[$(date '+%H:%M:%S')] [INFO]  $1"; }
warn()  { echo "[$(date '+%H:%M:%S')] [WARN]  $1"; }
error() { echo "[$(date '+%H:%M:%S')] [ERROR] $1" >&2; }

# --- Main ---
log "Health check: $URL (max $MAX_RETRIES retries, ${WAIT_SECONDS}s between)"

attempt=0
while [ $attempt -lt $MAX_RETRIES ]; do
    attempt=$((attempt + 1))
    log "Attempt $attempt of $MAX_RETRIES..."

    # Try to reach the URL
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --timeout "$TIMEOUT" "$URL" 2>/dev/null || echo "000")

    if [ "$HTTP_CODE" = "200" ]; then
        log "Service is healthy! (HTTP $HTTP_CODE)"
        exit 0
    else
        warn "Service not ready (HTTP $HTTP_CODE)"
        if [ $attempt -lt $MAX_RETRIES ]; then
            log "Waiting ${WAIT_SECONDS}s before next attempt..."
            sleep "$WAIT_SECONDS"
        fi
    fi
done

error "Service failed health check after $MAX_RETRIES attempts"
exit 1
SCRIPT

chmod +x scripts/health-check.sh

# Test it (will fail since nothing is running, but shows the retry logic)
./scripts/health-check.sh http://localhost:8080/health 3 2 || echo "Expected failure — no service running"
```

**Task 2: Image promotion script** ⏱️ ~45 min

```bash
cat << 'SCRIPT' > scripts/promote-image.sh
#!/bin/bash
# =============================================================================
# promote-image.sh — Promotes a Docker image from one environment to the next
# Usage: ./scripts/promote-image.sh <image_name> <source_env> <target_env>
# Example: ./scripts/promote-image.sh microbank/nginx dev sit
# =============================================================================

set -euo pipefail

# --- Arguments ---
IMAGE_NAME="${1:?Usage: $0 <image_name> <source_env> <target_env>}"
SOURCE_ENV="${2:?Specify source environment (dev/sit/uat)}"
TARGET_ENV="${3:?Specify target environment (sit/uat/prod)}"

# --- Validation ---
VALID_ENVS=("dev" "sit" "uat" "prod")
PROMOTION_ORDER=("dev" "sit" "uat" "prod")

log()   { echo "[$(date '+%H:%M:%S')] [INFO]  $1"; }
error() { echo "[$(date '+%H:%M:%S')] [ERROR] $1" >&2; exit 1; }

# Check valid environments
validate_env() {
    local env="$1"
    for valid in "${VALID_ENVS[@]}"; do
        if [ "$env" = "$valid" ]; then return 0; fi
    done
    error "Invalid environment: $env. Valid: ${VALID_ENVS[*]}"
}

validate_env "$SOURCE_ENV"
validate_env "$TARGET_ENV"

# Check promotion order (can't skip environments or go backward)
get_index() {
    local target="$1"
    for i in "${!PROMOTION_ORDER[@]}"; do
        if [ "${PROMOTION_ORDER[$i]}" = "$target" ]; then echo "$i"; return; fi
    done
}

SRC_IDX=$(get_index "$SOURCE_ENV")
TGT_IDX=$(get_index "$TARGET_ENV")

if [ "$TGT_IDX" -le "$SRC_IDX" ]; then
    error "Cannot promote backward: $SOURCE_ENV → $TARGET_ENV"
fi

if [ $((TGT_IDX - SRC_IDX)) -gt 1 ]; then
    error "Cannot skip environments: $SOURCE_ENV → $TARGET_ENV. Must promote to ${PROMOTION_ORDER[$((SRC_IDX+1))]} first."
fi

# --- Promotion ---
log "Promoting $IMAGE_NAME: $SOURCE_ENV → $TARGET_ENV"

SOURCE_TAG="${IMAGE_NAME}:${SOURCE_ENV}"
TARGET_TAG="${IMAGE_NAME}:${TARGET_ENV}"

log "Retagging $SOURCE_TAG → $TARGET_TAG"
docker tag "$SOURCE_TAG" "$TARGET_TAG" 2>/dev/null || error "Source image not found: $SOURCE_TAG"

log "Promotion complete: $TARGET_TAG"
log "Next step: verify in $TARGET_ENV environment, then approve for next promotion"

# In a real pipeline, this would push to a registry:
# docker push "$TARGET_TAG"
SCRIPT

chmod +x scripts/promote-image.sh
```

**Task 3: Write a Change Request template** ⏱️ ~30 min

📝 This practices the "management al procesului de livrare" requirement:

```bash
cat << 'EOF' > docs/change-request-template.md
# Change Request — [CR-XXXX]

## Summary
Brief description of what is being changed and why.

## Change Details
| Field | Value |
|-------|-------|
| Application | MicroBank |
| Component | [account-service / transaction-service / nginx / database] |
| Change Type | [Feature / Bugfix / Configuration / Infrastructure] |
| Risk Level | [Low / Medium / High] |
| Target Environment | [SIT / UAT / PROD] |
| Deployment Window | [Date, Time Range] |
| Rollback Plan | [Yes — described below] |

## What is Changing?
- List of specific changes

## Testing Completed
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Security scan clear
- [ ] Performance test (if applicable)

## Approvals Required
| Role | Name | Approved | Date |
|------|------|----------|------|
| Dev Lead | | [ ] | |
| QA Lead | | [ ] | |
| Release Manager | | [ ] | |
| Security (if High Risk) | | [ ] | |

## Rollback Plan
1. Step-by-step instructions to revert if deployment fails
2. ...

## Post-Deployment Verification
1. Check health endpoints
2. Verify key functionality
3. Monitor dashboards for 30 minutes
EOF
```

**Task 4: Write a deployment runbook** ⏱️ ~30 min

```bash
cat << 'EOF' > docs/runbook-deployment.md
# MicroBank Deployment Runbook

## Purpose
Step-by-step guide for deploying MicroBank to any environment.

## Pre-Deployment Checklist
- [ ] Change Request approved (CR-XXXX)
- [ ] All pipeline stages passed (green pipeline)
- [ ] Docker images promoted to target environment tag
- [ ] Database migrations reviewed (if any)
- [ ] Rollback plan documented
- [ ] Stakeholders notified of deployment window

## Deployment Steps

### 1. Verify Image Availability
```
docker pull registry.example.com/microbank/account-service:<version>
docker pull registry.example.com/microbank/transaction-service:<version>
docker pull registry.example.com/microbank/nginx:<version>
```

### 2. Database Backup (if production)
```
pg_dump -U microbank_user microbank > backup_$(date +%Y%m%d_%H%M%S).sql
```

### 3. Deploy
```
./scripts/deploy-local.sh up
```

### 4. Post-Deployment Verification
```
./scripts/health-check.sh http://localhost:80/health 5 10
./scripts/health-check.sh http://localhost:8080/actuator/health 5 10
```

### 5. Monitor (30 minutes)
- Check Grafana dashboard (when available)
- Watch application logs: `docker compose logs -f`
- Verify no error spikes

## Rollback Procedure
If deployment fails:
1. Stop current deployment: `docker compose down`
2. Restore previous image tags
3. Redeploy: `docker compose up -d`
4. Verify health
5. Notify stakeholders

## Post-Deployment
- [ ] Update deployment log
- [ ] Close Change Request
- [ ] Notify stakeholders of completion
EOF
```

**Task 5: Integrate scripts into GitLab CI** ⏱️ ~30 min

Add to your `.gitlab-ci.yml`:

```yaml
# Add after the deploy-staging job:

promote-to-sit:
  stage: deploy
  image: docker:24
  services:
    - docker:24-dind
  script:
    - echo "Promoting images from dev to SIT..."
    # In real life: ./scripts/promote-image.sh microbank/nginx dev sit
    - echo "Promotion complete. Awaiting SIT testing approval."
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
      when: manual
  environment:
    name: sit
```

**Task 6: Commit and push** ⏱️ ~10 min

```bash
git add .
git commit -m "Add automation scripts, change request template, and deployment runbook"
git push github main
git push gitlab main
```

#### Self-Test
1. Why does the health check script use retry logic instead of a single check?
2. Why can't you promote an image from DEV directly to PROD?
3. What is a Change Request and why do banks require them?
4. What should a deployment runbook contain?
5. Who needs to approve a change before it goes to production?
6. **Teach-back:** Explain to a project manager why we need manual approval gates in the pipeline.

#### Interview Angle
**Q: "Describe the software delivery process at your project."**
A: "We follow a gated promotion process. Code merges to main trigger a pipeline that builds, tests, and packages Docker images. Images are tagged for DEV automatically. Promotion to SIT requires a manual gate in the pipeline and an approved Change Request. After SIT testing passes, we promote to UAT with QA Lead approval, and finally to PROD with Release Manager approval. Every deployment follows a documented runbook with pre-checks, deployment steps, verification, and rollback procedures."

---

**📝 Mid-Project Review (End of Week 3):**

Write a 1-page document: `docs/project-summary-week3.md` covering:
1. What you've built so far (list all components)
2. How the CI/CD pipeline works (describe the flow)
3. What you'd present to an Ops team receiving this project
4. What's still missing (from the JD perspective)

This practices the presentation/handoff skill the JD requires.

---

## Week 4: Kubernetes & OpenShift

> This week's goal: Deploy MicroBank to Kubernetes and understand OpenShift. By Friday, MicroBank runs in a Kubernetes cluster with proper health checks, configs, and scaling.

---

### Phase 8: Kubernetes Fundamentals (Days 1-3)

**Goal:** Create and manage Kubernetes resources to deploy and expose containerized applications.

**Why this matters for the job:** The JD lists "OpenShift/Kubernetes" as a core skill. Kubernetes is the standard container orchestration platform. OpenShift is Red Hat's enterprise version of Kubernetes (built on top of it).

**Tools & setup:**
```bash
# Install Minikube (local Kubernetes cluster)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install kubectl (Kubernetes command line tool)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl

# Start Minikube
minikube start --memory=4096 --cpus=2
# This creates a single-node Kubernetes cluster on your machine

# Verify it works
kubectl cluster-info
kubectl get nodes
# Should show one node with status "Ready"
```

**⏱️ Total: ~21 hours across 3 days**

#### Concepts to Learn First

**What is Kubernetes (K8s)?**
Kubernetes manages containers at scale. Docker runs single containers; Kubernetes manages hundreds or thousands. It handles:
- **Scheduling** — deciding which server runs which container
- **Self-healing** — restarting containers that crash
- **Scaling** — adding/removing container copies based on load
- **Networking** — routing traffic between containers
- **Storage** — managing persistent data

Think of Docker as driving a single car. Kubernetes is managing a fleet of delivery trucks.

**Key Kubernetes concepts:**
- **Pod:** The smallest unit — one or more containers running together. Usually one container per pod.
- **Deployment:** Manages pods — how many copies (replicas), which image version, update strategy.
- **Service:** A stable network endpoint for pods. Pods come and go; the Service stays.
- **ConfigMap:** Configuration data (environment variables, config files) stored separately from images.
- **Secret:** Like ConfigMap but for sensitive data (passwords, tokens). Base64 encoded (NOT encrypted!).
- **Namespace:** A way to organize resources — like folders for different teams or environments.
- **PersistentVolumeClaim (PVC):** A request for storage — used for databases.
- **Ingress:** Routes external traffic into the cluster.

**What is OpenShift?**
OpenShift is Red Hat's enterprise Kubernetes distribution. Everything in Kubernetes works in OpenShift, plus extra features:
- **Routes** (similar to Ingress, but simpler)
- **Security Context Constraints (SCC)** (stricter security by default)
- **Projects** (like namespaces but with more features)
- **Built-in CI/CD** (Source-to-Image builds)
- **Web console** (better UI than vanilla K8s)

In this phase, we learn Kubernetes. In Phase 9, we'll cover OpenShift differences.

**How do K8s manifests relate to what you already know?**
Kubernetes resources are defined in YAML files (manifests) — exactly like you learned in Phase 3. Instead of `docker-compose.yml`, you write Deployment, Service, and ConfigMap YAML files.

#### Tasks

**Task 1: Explore your cluster** ⏱️ ~30 min

```bash
# See cluster info
kubectl cluster-info

# See nodes (machines in the cluster)
kubectl get nodes

# See all namespaces
kubectl get namespaces
# You'll see: default, kube-system, kube-public, kube-node-lease

# Create namespaces for MicroBank
kubectl create namespace microbank-dev
kubectl create namespace microbank-staging

# Set microbank-dev as your default namespace
kubectl config set-context --current --namespace=microbank-dev
```

**Task 2: Your first Pod** ⏱️ ~45 min

```bash
cd ~/microbank-project
mkdir -p k8s/base

cat << 'EOF' > k8s/base/test-pod.yaml
# A Pod is the smallest deployable unit in Kubernetes
# This runs a simple Nginx container for testing
apiVersion: v1              # Kubernetes API version
kind: Pod                   # What type of resource
metadata:
  name: test-nginx          # Name of this pod
  namespace: microbank-dev  # Which namespace it belongs to
  labels:
    app: test-nginx         # Labels are used for selection/filtering
spec:
  containers:
    - name: nginx                # Container name
      image: nginx:alpine       # Docker image to run
      ports:
        - containerPort: 80     # Port the container listens on
      resources:
        requests:               # Minimum resources needed
          memory: "64Mi"
          cpu: "100m"           # 100 millicpu = 0.1 CPU
        limits:                 # Maximum resources allowed
          memory: "128Mi"
          cpu: "250m"
EOF

# Apply it (tell Kubernetes to create this resource)
kubectl apply -f k8s/base/test-pod.yaml

# Watch it start
kubectl get pods -w
# Press Ctrl+C when it shows STATUS: Running

# Get detailed info
kubectl describe pod test-nginx

# View logs
kubectl logs test-nginx

# Execute a command inside the pod (like docker exec)
kubectl exec -it test-nginx -- /bin/sh
# You're now inside the container
hostname
exit

# Delete the pod
kubectl delete pod test-nginx
```

**Task 3: Deployments — managing multiple pod copies** ⏱️ ~60 min

```bash
cat << 'EOF' > k8s/base/nginx-deployment.yaml
# A Deployment manages pods automatically
# It ensures the desired number of replicas are always running
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-test
  namespace: microbank-dev
  labels:
    app: nginx-test
spec:
  replicas: 3                    # Run 3 copies of this pod
  selector:
    matchLabels:
      app: nginx-test            # Manage pods with this label
  template:                      # Template for creating pods
    metadata:
      labels:
        app: nginx-test
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
          ports:
            - containerPort: 80
          resources:
            requests:
              memory: "64Mi"
              cpu: "100m"
            limits:
              memory: "128Mi"
              cpu: "250m"
  strategy:
    type: RollingUpdate          # Update pods one at a time (no downtime)
    rollingUpdate:
      maxSurge: 1                # Max 1 extra pod during update
      maxUnavailable: 0          # Never reduce below desired replicas
EOF

# Apply the deployment
kubectl apply -f k8s/base/nginx-deployment.yaml

# Watch pods being created
kubectl get pods -w
# You should see 3 pods starting up

# See the deployment
kubectl get deployments
# Shows: READY 3/3

# Scale up to 5 replicas
kubectl scale deployment nginx-test --replicas=5
kubectl get pods
# Now 5 pods running!

# Scale back down
kubectl scale deployment nginx-test --replicas=2
kubectl get pods
# 3 pods terminating, 2 remaining
```

**Task 4: Services — stable networking** ⏱️ ~45 min

```bash
cat << 'EOF' > k8s/base/nginx-service.yaml
# A Service provides a stable network endpoint for pods
# Pods are temporary (they come and go); Services are permanent
apiVersion: v1
kind: Service
metadata:
  name: nginx-test-service
  namespace: microbank-dev
spec:
  type: NodePort                 # Expose outside the cluster (for testing)
  selector:
    app: nginx-test              # Route traffic to pods with this label
  ports:
    - port: 80                   # Service port
      targetPort: 80             # Container port
      nodePort: 30080            # External port (30000-32767 range)
EOF

kubectl apply -f k8s/base/nginx-service.yaml

# Access the service
minikube service nginx-test-service -n microbank-dev --url
# This gives you a URL like http://192.168.49.2:30080
# Visit it in your browser — you should see Nginx welcome page!

# See all services
kubectl get services
```

**Task 5: ConfigMaps and Secrets** ⏱️ ~45 min

```bash
cat << 'EOF' > k8s/base/microbank-configmap.yaml
# ConfigMap stores non-sensitive configuration
# Applications read these values as environment variables
apiVersion: v1
kind: ConfigMap
metadata:
  name: microbank-config
  namespace: microbank-dev
data:
  DB_HOST: "postgres"
  DB_PORT: "5432"
  DB_NAME: "microbank"
  APP_ENV: "dev"
  LOG_LEVEL: "DEBUG"
EOF

cat << 'EOF' > k8s/base/microbank-secret.yaml
# Secret stores sensitive data
# Values must be base64 encoded (this is encoding, NOT encryption!)
# To encode: echo -n "mypassword" | base64
# To decode: echo "bXlwYXNzd29yZA==" | base64 -d
apiVersion: v1
kind: Secret
metadata:
  name: microbank-db-secret
  namespace: microbank-dev
type: Opaque
data:
  DB_USER: bWljcm9iYW5rX3VzZXI=          # microbank_user
  DB_PASSWORD: Y2hhbmdlbWUxMjM=            # changeme123
EOF

kubectl apply -f k8s/base/microbank-configmap.yaml
kubectl apply -f k8s/base/microbank-secret.yaml

# Verify
kubectl get configmaps
kubectl get secrets
kubectl describe configmap microbank-config
```

⚠️ **Important security note:** Kubernetes Secrets are only base64 encoded, NOT encrypted. Anyone with access to the cluster can decode them. In production, banks use additional encryption (e.g., envelope encryption, external secret managers).

**Task 6: Clean up test resources** ⏱️ ~10 min

```bash
kubectl delete deployment nginx-test -n microbank-dev
kubectl delete service nginx-test-service -n microbank-dev
# Keep the ConfigMap and Secret — we'll use them in Phase 9
```

**Task 7: Commit K8s manifests** ⏱️ ~10 min

```bash
cd ~/microbank-project
git add .
git commit -m "Add Kubernetes manifests: namespaces, deployment, service, configmap, secret"
git push github main
git push gitlab main
```

#### Common Mistakes & How to Fix Them

1. **Pod stuck in "Pending"** → Not enough resources. Check `kubectl describe pod` for events. Try `minikube delete && minikube start --memory=4096`.
2. **"ImagePullBackOff"** → Kubernetes can't pull the image. Check the image name and tag. For local images, use `minikube image load`.
3. **"CrashLoopBackOff"** → The container starts and immediately crashes. Check logs: `kubectl logs podname`.
4. **Service not accessible** → Check if pods are running AND have the right labels matching the service selector.
5. **Wrong namespace** → Remember to add `-n microbank-dev` or set your default namespace.

#### Self-Test
1. What's the difference between a Pod and a Deployment?
2. Why do we use Services instead of connecting directly to Pods?
3. What's the difference between a ConfigMap and a Secret?
4. What does `replicas: 3` mean in a Deployment?
5. Why is base64 encoding in Secrets NOT the same as encryption?
6. What happens if you delete a Pod managed by a Deployment?

#### Interview Angle
**Q: "Explain the difference between a Pod, Deployment, and Service."**
A: "A Pod is the smallest unit — it runs one or more containers. A Deployment manages Pods: it ensures the desired number of replicas are running, handles rolling updates, and replaces crashed Pods. A Service provides a stable network endpoint — Pods are ephemeral with changing IPs, but the Service gives them a consistent address. When a Pod dies and a new one is created, the Service automatically routes to the healthy one."

---

### Phase 9: Full K8s Deployment + OpenShift + Helm (Days 4-7)

**Goal:** Deploy the complete MicroBank stack to Kubernetes, package it as a Helm chart, and understand OpenShift differences.

**Why this matters for the job:** The JD specifically mentions "OpenShift/Kubernetes." You need to deploy real applications, not just test pods. Helm is the standard way to package and deploy K8s applications.

**Tools & setup:**
```bash
# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```

**⏱️ Total: ~28 hours across 4 days**

#### Concepts to Learn First

**What is Helm?**
Helm is a package manager for Kubernetes — like `apt` for Ubuntu. Instead of applying many individual YAML files, Helm bundles them into a "chart" (a package). Charts support variables, so you can deploy the same application with different settings per environment.

**What are Helm values?**
A `values.yaml` file contains configurable parameters. Each environment (dev, sit, uat, prod) can have its own values file that overrides defaults. Example: dev uses 1 replica, prod uses 3.

**OpenShift vs Kubernetes — key differences for the interview:**
| Feature | Kubernetes | OpenShift |
|---------|-----------|-----------|
| Vendor | CNCF (open-source) | Red Hat (commercial) |
| CLI tool | `kubectl` | `oc` (superset of kubectl) |
| External access | Ingress | Routes (simpler syntax) |
| Security | Flexible | Strict by default (SCC) |
| Namespaces | Namespaces | Projects (namespaces + RBAC) |
| Container registry | External | Built-in |
| Web console | Dashboard (basic) | Full web console |
| Build system | External (CI/CD) | Source-to-Image (S2I) built-in |

#### Tasks

**Task 1: PostgreSQL Deployment** ⏱️ ~45 min

```bash
mkdir -p ~/microbank-project/k8s/microbank

cat << 'EOF' > k8s/microbank/postgres-deployment.yaml
# PostgreSQL Database for MicroBank
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
  namespace: microbank-dev
  labels:
    app: postgres
    component: database
spec:
  replicas: 1                    # Databases: always 1 replica (use StatefulSet for production)
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
        - name: postgres
          image: postgres:15-alpine
          ports:
            - containerPort: 5432
          env:
            - name: POSTGRES_DB
              valueFrom:
                configMapKeyRef:
                  name: microbank-config
                  key: DB_NAME
            - name: POSTGRES_USER
              valueFrom:
                secretKeyRef:
                  name: microbank-db-secret
                  key: DB_USER
            - name: POSTGRES_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: microbank-db-secret
                  key: DB_PASSWORD
          resources:
            requests:
              memory: "256Mi"
              cpu: "250m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          volumeMounts:
            - name: db-storage
              mountPath: /var/lib/postgresql/data
          readinessProbe:
            exec:
              command: ["pg_isready", "-U", "microbank_user"]
            initialDelaySeconds: 5
            periodSeconds: 10
          livenessProbe:
            exec:
              command: ["pg_isready", "-U", "microbank_user"]
            initialDelaySeconds: 15
            periodSeconds: 20
      volumes:
        - name: db-storage
          persistentVolumeClaim:
            claimName: postgres-pvc
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-pvc
  namespace: microbank-dev
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Service
metadata:
  name: postgres
  namespace: microbank-dev
spec:
  type: ClusterIP                # Only accessible within the cluster
  selector:
    app: postgres
  ports:
    - port: 5432
      targetPort: 5432
EOF

kubectl apply -f k8s/microbank/postgres-deployment.yaml

# Verify
kubectl get pods -l app=postgres
kubectl get pvc
kubectl get svc postgres
```

**Task 2: Account Service Deployment** ⏱️ ~30 min

```bash
cat << 'EOF' > k8s/microbank/account-service-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: account-service
  namespace: microbank-dev
  labels:
    app: account-service
    component: backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: account-service
  template:
    metadata:
      labels:
        app: account-service
    spec:
      containers:
        - name: account-service
          image: microbank/account-service:dev
          ports:
            - containerPort: 8080
          env:
            - name: SPRING_DATASOURCE_URL
              value: "jdbc:postgresql://postgres:5432/microbank"
            - name: SPRING_DATASOURCE_USERNAME
              valueFrom:
                secretKeyRef:
                  name: microbank-db-secret
                  key: DB_USER
            - name: SPRING_DATASOURCE_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: microbank-db-secret
                  key: DB_PASSWORD
          resources:
            requests:
              memory: "256Mi"
              cpu: "250m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          readinessProbe:
            httpGet:
              path: /actuator/health
              port: 8080
            initialDelaySeconds: 30       # Java apps need time to start
            periodSeconds: 10
          livenessProbe:
            httpGet:
              path: /actuator/health
              port: 8080
            initialDelaySeconds: 60
            periodSeconds: 20
          startupProbe:                    # Extra time for first startup
            httpGet:
              path: /actuator/health
              port: 8080
            failureThreshold: 30
            periodSeconds: 10
---
apiVersion: v1
kind: Service
metadata:
  name: account-service
  namespace: microbank-dev
spec:
  type: ClusterIP
  selector:
    app: account-service
  ports:
    - port: 8080
      targetPort: 8080
EOF

kubectl apply -f k8s/microbank/account-service-deployment.yaml
```

**Task 3: Create Helm chart** ⏱️ ~90 min

```bash
cd ~/microbank-project

# Create Helm chart structure
helm create helm/microbank
# This creates a template chart. We'll customize it.

# Look at the structure
tree helm/microbank/

# Edit values.yaml with MicroBank defaults
cat << 'EOF' > helm/microbank/values.yaml
# Default values for MicroBank
# Override per environment with values-<env>.yaml

replicaCount: 1

postgres:
  enabled: true
  image:
    repository: postgres
    tag: "15-alpine"
  resources:
    requests:
      memory: "256Mi"
      cpu: "250m"
    limits:
      memory: "512Mi"
      cpu: "500m"
  storage:
    size: 1Gi

accountService:
  image:
    repository: microbank/account-service
    tag: "dev"
  replicas: 1
  port: 8080
  resources:
    requests:
      memory: "256Mi"
      cpu: "250m"
    limits:
      memory: "512Mi"
      cpu: "500m"

transactionService:
  image:
    repository: microbank/transaction-service
    tag: "dev"
  replicas: 1
  port: 8081

nginx:
  image:
    repository: microbank/nginx
    tag: "dev"
  replicas: 1
  port: 80

environment: dev
logLevel: DEBUG
EOF

# Create environment-specific overrides
cat << 'EOF' > helm/microbank/values-dev.yaml
# Development environment overrides
environment: dev
logLevel: DEBUG

accountService:
  replicas: 1

transactionService:
  replicas: 1
EOF

cat << 'EOF' > helm/microbank/values-staging.yaml
# Staging environment overrides
environment: staging
logLevel: INFO

accountService:
  replicas: 2

transactionService:
  replicas: 2
EOF
```

**Task 4: Test Helm chart** ⏱️ ~30 min

```bash
# Validate the chart
helm lint helm/microbank/

# Dry run — see what would be applied without applying
helm template microbank helm/microbank/ -f helm/microbank/values-dev.yaml

# Install (dry run)
helm install microbank helm/microbank/ \
  -f helm/microbank/values-dev.yaml \
  -n microbank-dev \
  --dry-run

# If everything looks good, install for real:
# helm install microbank helm/microbank/ -f helm/microbank/values-dev.yaml -n microbank-dev
```

**Task 5: OpenShift concepts comparison** ⏱️ ~60 min

📝 Write this comparison document (the JD requires OpenShift knowledge):

```bash
cat << 'EOF' > docs/openshift-vs-kubernetes.md
# OpenShift vs Kubernetes — Comparison for MicroBank

## What is OpenShift?
OpenShift is Red Hat's enterprise Kubernetes platform. It adds:
- Stricter security defaults
- Built-in CI/CD
- Better web console
- Enterprise support

## Key Differences

### 1. Access Control
**Kubernetes:** Uses RBAC (Role-Based Access Control). Flexible but requires manual setup.
**OpenShift:** Uses SCCs (Security Context Constraints) in addition to RBAC. 
By default, containers cannot run as root. Our Dockerfiles already use non-root users, so they're OpenShift-compatible.

### 2. External Access
**Kubernetes Ingress:**
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: microbank-ingress
spec:
  rules:
    - host: microbank.example.com
      http:
        paths:
          - path: /api/accounts
            pathType: Prefix
            backend:
              service:
                name: account-service
                port:
                  number: 8080
```

**OpenShift Route (equivalent, simpler):**
```yaml
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: microbank-route
spec:
  host: microbank.example.com
  to:
    kind: Service
    name: account-service
  port:
    targetPort: 8080
  tls:
    termination: edge
```

### 3. CLI
- `kubectl get pods` → also works in OpenShift
- `oc get pods` → OpenShift CLI (superset of kubectl)
- `oc new-project microbank` → creates a "Project" (enhanced namespace)
- `oc new-app` → creates app from source or image

### 4. Projects vs Namespaces
OpenShift Projects = Kubernetes Namespaces + RBAC defaults + quotas

### 5. Developer Sandbox (Free!)
Red Hat offers a free OpenShift Developer Sandbox:
https://developers.redhat.com/developer-sandbox
30-day free access to a real OpenShift cluster.

## What MicroBank needs to change for OpenShift
1. Dockerfiles: Already use non-root users ✅
2. Ports: Use ports > 1024 (non-privileged) ✅
3. Replace Ingress with Route manifests
4. Add SecurityContext to deployments
EOF
```

💡 **Optional hands-on:** Sign up for the free OpenShift Developer Sandbox and deploy a test application there.

**Task 6: Debugging exercises** ⏱️ ~60 min

```bash
# Exercise 1: Fix ImagePullBackOff
cat << 'EOF' > k8s/debug/broken-image.yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-image
  namespace: microbank-dev
spec:
  containers:
    - name: app
      image: microbank/nonexistent:v999    # This image doesn't exist!
      ports:
        - containerPort: 8080
EOF

kubectl apply -f k8s/debug/broken-image.yaml
kubectl get pods
# Status: ImagePullBackOff
kubectl describe pod debug-image | grep -A5 Events
# Shows: "Failed to pull image"
# FIX: Change to a valid image name
kubectl delete pod debug-image

# Exercise 2: Fix OOMKilled
cat << 'EOF' > k8s/debug/broken-memory.yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-oom
  namespace: microbank-dev
spec:
  containers:
    - name: app
      image: nginx:alpine
      resources:
        limits:
          memory: "5Mi"    # Way too low — Nginx needs at least 32Mi
EOF

kubectl apply -f k8s/debug/broken-memory.yaml
# Wait a few seconds...
kubectl get pods
# Status: OOMKilled or CrashLoopBackOff
kubectl describe pod debug-oom | grep -A5 "Last State"
# Shows: OOMKilled
kubectl delete pod debug-oom
```

**Task 7: Commit everything** ⏱️ ~10 min

```bash
cd ~/microbank-project
mkdir -p k8s/debug
git add .
git commit -m "Add full K8s deployment, Helm chart, OpenShift comparison, debugging exercises"
git push github main
git push gitlab main
```

#### Self-Test
1. What problem does Helm solve that plain kubectl doesn't?
2. What is a `values.yaml` file and how do you use it for multiple environments?
3. Name 3 key differences between OpenShift and vanilla Kubernetes.
4. What's the difference between `livenessProbe`, `readinessProbe`, and `startupProbe`?
5. Why does a Java app need a longer `initialDelaySeconds` than Nginx?
6. What does "ImagePullBackOff" mean and how do you fix it?
7. **Teach-back:** Explain to a developer why we use Kubernetes instead of just Docker Compose in production.

#### Interview Angle
**Q: "Have you worked with OpenShift?"**
A: "I've studied OpenShift alongside Kubernetes. I understand the key differences: OpenShift uses Routes instead of Ingress, enforces stricter security with SCCs, and organizes resources into Projects instead of plain namespaces. Our Dockerfiles were designed to be OpenShift-compatible — they use non-root users and non-privileged ports. I've also explored the OpenShift Developer Sandbox."

**Q: "How do you manage different configurations per environment in Kubernetes?"**
A: "I use Helm with environment-specific values files. The chart templates are the same, but `values-dev.yaml` might set 1 replica and DEBUG logging, while `values-staging.yaml` sets 2 replicas and INFO logging. This makes deployments consistent and predictable across environments."

---

## Week 5: Ansible, Artifactory & Cloud Basics

> This week's goal: Automate infrastructure setup with Ansible, manage artifacts properly, and get your feet wet with cloud concepts.

---

### Phase 10: Ansible — Configuration Management (Days 1-4)

**Goal:** Use Ansible to automate server configuration and application deployment across multiple hosts.

**Why this matters for the job:** The JD lists "Ansible — gestionarea și implementarea configurației" as a core skill. Ansible is how you configure servers consistently and repeatably without manual SSH sessions.

**Tools & setup:**
```bash
sudo apt install -y ansible
ansible --version
```

**⏱️ Total: ~28 hours across 4 days**

#### Concepts to Learn First

**What is Ansible?**
Ansible is an automation tool that configures computers remotely. You write "playbooks" (YAML files describing what you want) and Ansible connects to target machines via SSH and makes it happen. No software needs to be installed on the target machines — this is "agentless."

**Key Ansible concepts:**
- **Inventory:** A list of machines to manage (hostnames or IPs)
- **Playbook:** A YAML file describing tasks to execute
- **Task:** A single action (install a package, copy a file, start a service)
- **Module:** A built-in Ansible function (e.g., `apt` for installing packages, `copy` for files)
- **Role:** A reusable, organized collection of tasks (like a function in programming)
- **Handler:** A task that only runs when triggered (e.g., restart Nginx only if config changed)
- **Template:** A file with variables that Ansible fills in (Jinja2 format — similar to Python string formatting)
- **Vault:** Ansible's built-in encryption for sensitive data (passwords, keys)
- **Idempotency:** Running the same playbook twice produces the same result — no duplicate changes.

#### Tasks

**Task 1: First playbook — configure localhost** ⏱️ ~45 min

```bash
cd ~/microbank-project
mkdir -p ansible

# Create inventory file
cat << 'EOF' > ansible/inventory.yml
# Ansible Inventory — lists all machines we manage
all:
  hosts:
    localhost:
      ansible_connection: local    # Don't SSH, just run locally
  children:
    dev:
      hosts:
        localhost:
    # In production, you'd have real servers here:
    # staging:
    #   hosts:
    #     staging-server-1:
    #       ansible_host: 10.0.1.10
    #       ansible_user: deploy
EOF

# Create your first playbook
cat << 'EOF' > ansible/setup-devtools.yml
# =============================================================================
# setup-devtools.yml — Installs DevOps tools on target machines
# Run with: ansible-playbook -i ansible/inventory.yml ansible/setup-devtools.yml
# =============================================================================
---
- name: Setup DevOps tools on MicroBank servers
  hosts: localhost                     # Which hosts from inventory to target
  become: true                         # Run as root (sudo)

  vars:
    required_packages:
      - curl
      - wget
      - jq
      - tree
      - htop
      - net-tools

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
        cache_valid_time: 3600         # Don't update if less than 1 hour old

    - name: Install required packages
      apt:
        name: "{{ required_packages }}"
        state: present                  # Ensure packages are installed

    - name: Create MicroBank directories
      file:
        path: "{{ item }}"
        state: directory
        mode: "0755"
      loop:
        - /opt/microbank
        - /opt/microbank/configs
        - /opt/microbank/logs
        - /opt/microbank/backups

    - name: Create MicroBank system user
      user:
        name: microbank
        system: yes
        shell: /bin/bash
        home: /opt/microbank
        create_home: no

    - name: Set directory ownership
      file:
        path: /opt/microbank
        owner: microbank
        group: microbank
        recurse: yes
EOF

# Run it!
ansible-playbook -i ansible/inventory.yml ansible/setup-devtools.yml

# Run it again — notice it says "changed=0" for most tasks
# This is idempotency: running it twice doesn't change anything
ansible-playbook -i ansible/inventory.yml ansible/setup-devtools.yml
```

✅ **Verification:** The second run shows `changed=0` for tasks that were already done. This proves idempotency.

**Task 2: Templates with Jinja2** ⏱️ ~45 min

```bash
mkdir -p ansible/templates

# Create a template for Nginx config
cat << 'EOF' > ansible/templates/nginx.conf.j2
# Nginx configuration — generated by Ansible
# Environment: {{ environment_name }}
# Generated on: {{ ansible_date_time.iso8601 }}

events {
    worker_connections {{ nginx_worker_connections | default(1024) }};
}

http {
{% for service in microbank_services %}
    upstream {{ service.name }} {
        server {{ service.host }}:{{ service.port }};
    }

{% endfor %}
    server {
        listen {{ nginx_listen_port | default(80) }};

{% for service in microbank_services %}
        location /api/{{ service.name | replace('-service', '') }} {
            proxy_pass http://{{ service.name }};
        }

{% endfor %}
        location /health {
            return 200 'OK';
        }
    }
}
EOF

# Create playbook that uses the template
cat << 'EOF' > ansible/deploy-nginx.yml
---
- name: Deploy Nginx configuration for MicroBank
  hosts: localhost
  become: true

  vars:
    environment_name: "dev"
    nginx_listen_port: 80
    nginx_worker_connections: 512
    microbank_services:
      - name: account-service
        host: localhost
        port: 8080
      - name: transaction-service
        host: localhost
        port: 8081

  tasks:
    - name: Generate Nginx config from template
      template:
        src: templates/nginx.conf.j2
        dest: /opt/microbank/configs/nginx.conf
        mode: "0644"
      notify: Restart Nginx            # Triggers handler only if config changed

    - name: Display generated config
      command: cat /opt/microbank/configs/nginx.conf
      register: config_output
      changed_when: false

    - name: Show config
      debug:
        msg: "{{ config_output.stdout_lines }}"

  handlers:
    - name: Restart Nginx
      debug:
        msg: "Would restart Nginx service here (not installed for demo)"
EOF

ansible-playbook -i ansible/inventory.yml ansible/deploy-nginx.yml
```

**Task 3: Ansible Vault — encrypting secrets** ⏱️ ~30 min

```bash
# Create an encrypted file for secrets
ansible-vault create ansible/vars/secrets.yml
# You'll be prompted for a password (remember it!)
# An editor opens. Add:
# db_password: microbank_secure_2024
# api_key: sk-1234567890abcdef

# View encrypted content
cat ansible/vars/secrets.yml
# Shows encrypted gibberish — safe to commit to Git!

# Edit later:
# ansible-vault edit ansible/vars/secrets.yml

# Use in a playbook:
# ansible-playbook -i inventory.yml playbook.yml --ask-vault-pass
```

**Task 4: Create MicroBank Ansible role** ⏱️ ~60 min

```bash
# Create role structure
mkdir -p ansible/roles/microbank/{tasks,handlers,templates,vars,defaults,files}

# defaults/main.yml — default variables (overridable)
cat << 'EOF' > ansible/roles/microbank/defaults/main.yml
---
microbank_env: dev
microbank_base_dir: /opt/microbank
microbank_user: microbank
microbank_db_port: 5432
microbank_account_port: 8080
microbank_transaction_port: 8081
EOF

# tasks/main.yml — the main task list
cat << 'EOF' > ansible/roles/microbank/tasks/main.yml
---
- name: Ensure Docker is installed
  apt:
    name: docker.io
    state: present
  become: true

- name: Ensure Docker service is running
  service:
    name: docker
    state: started
    enabled: true
  become: true

- name: Create application directories
  file:
    path: "{{ microbank_base_dir }}/{{ item }}"
    state: directory
    owner: "{{ microbank_user }}"
    mode: "0755"
  loop:
    - configs
    - logs
    - data
  become: true

- name: Deploy environment configuration
  template:
    src: environment.yaml.j2
    dest: "{{ microbank_base_dir }}/configs/environment.yaml"
    owner: "{{ microbank_user }}"
    mode: "0644"
  notify: Restart MicroBank services
  become: true
EOF

# handlers/main.yml
cat << 'EOF' > ansible/roles/microbank/handlers/main.yml
---
- name: Restart MicroBank services
  debug:
    msg: "Restarting MicroBank services for {{ microbank_env }} environment"
EOF

# templates/environment.yaml.j2
cat << 'EOF' > ansible/roles/microbank/templates/environment.yaml.j2
# MicroBank Configuration — {{ microbank_env }}
# Generated by Ansible on {{ ansible_date_time.iso8601 }}

environment: {{ microbank_env }}
database:
  host: postgres-{{ microbank_env }}
  port: {{ microbank_db_port }}
services:
  account:
    port: {{ microbank_account_port }}
  transaction:
    port: {{ microbank_transaction_port }}
EOF

# Create the playbook that uses the role
cat << 'EOF' > ansible/site.yml
---
- name: Deploy MicroBank
  hosts: localhost
  roles:
    - role: microbank
      vars:
        microbank_env: dev
EOF

ansible-playbook -i ansible/inventory.yml ansible/site.yml
```

**Task 5: Commit Ansible work** ⏱️ ~10 min

```bash
cd ~/microbank-project
git add .
git commit -m "Add Ansible playbooks, roles, templates, and vault for MicroBank deployment"
git push github main
git push gitlab main
```

#### Self-Test
1. What does "agentless" mean in the context of Ansible?
2. What is idempotency and why is it important?
3. What's the difference between a playbook and a role?
4. What does Ansible Vault do? Why is it better than storing passwords in plain text?
5. When does a handler run? What triggers it?
6. What's the difference between `copy` and `template` modules?

#### Interview Angle
**Q: "How have you used Ansible?"**
A: "I used Ansible to automate MicroBank deployment. I created roles that install Docker, configure Nginx using Jinja2 templates customized per environment, and deploy application containers. The playbooks are idempotent — running them twice produces no changes. Sensitive data like database passwords is encrypted with Ansible Vault and safely stored in Git."

---

### Phase 11: Artifactory & Cloud Basics (Days 5-7)

**Goal:** Understand artifact management with Artifactory and deploy a basic resource in the cloud.

**Why this matters for the job:** The JD explicitly lists "Artifactory — Artifacts repository" and mentions "mediu cloud." Artifactory is the standard artifact manager at enterprise banks.

**⏱️ Total: ~18 hours across 3 days**

#### Concepts to Learn First

**What is Artifactory?**
JFrog Artifactory is a universal artifact repository. Think of it as a library for all the software your company builds:
- Docker images
- JAR files (Java)
- npm packages (Node.js)
- Helm charts
- Generic files

**Why not just use Docker Hub?**
- Docker Hub is public. Banks need private repositories.
- Artifactory stores ALL artifact types, not just Docker images.
- Artifactory integrates with CI/CD for traceability (which pipeline built which artifact).
- Artifactory supports repository types: **local** (your artifacts), **remote** (cached proxies of external repos like Docker Hub), **virtual** (combines local + remote into one URL).

**What is "the cloud"?**
Cloud = renting computers/services from providers like AWS, Azure, or GCP instead of buying your own hardware. Key concepts:
- **VM (Virtual Machine)** — a computer in the cloud
- **IAM** — Identity and Access Management (who can do what)
- **VPC** — Virtual Private Cloud (your private network in the cloud)
- **S3/Blob Storage** — file storage in the cloud

#### Tasks

**Task 1: Set up a local Docker registry (Artifactory stand-in)** ⏱️ ~30 min

```bash
# Run a local Docker registry (simulates Artifactory's Docker registry)
docker run -d -p 5000:5000 --name local-registry registry:2

# Tag an image for the local registry
docker tag microbank/nginx:dev localhost:5000/microbank/nginx:dev

# Push to local registry
docker push localhost:5000/microbank/nginx:dev

# Verify it's there
curl http://localhost:5000/v2/_catalog
# Output: {"repositories":["microbank/nginx"]}

# List tags
curl http://localhost:5000/v2/microbank/nginx/tags/list
# Output: {"name":"microbank/nginx","tags":["dev"]}
```

**Task 2: Image scanning with Trivy** ⏱️ ~30 min

```bash
# Install Trivy (container security scanner)
sudo apt install -y wget apt-transport-https
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update && sudo apt install -y trivy

# Scan the MicroBank Nginx image
trivy image microbank/nginx:dev

# Scan with severity filter
trivy image --severity HIGH,CRITICAL microbank/nginx:dev
```

**Task 3: Document Artifactory concepts** ⏱️ ~30 min

```bash
cat << 'EOF' > docs/artifactory-guide.md
# Artifactory at MicroBank

## Repository Types
- **Local Repository**: Where we store our own built artifacts (Docker images, JARs)
  - Example: `microbank-docker-local` for our Docker images
  - Example: `microbank-maven-local` for our Java JARs

- **Remote Repository**: A cached proxy of external repositories
  - Example: `docker-hub-remote` caches images from Docker Hub
  - Example: `maven-central-remote` caches Java libraries from Maven Central
  - Benefit: faster builds (cached locally) + works even if external repo is down

- **Virtual Repository**: Combines local + remote into one URL
  - Example: `docker-virtual` = `microbank-docker-local` + `docker-hub-remote`
  - Developers use one URL; Artifactory decides where to find the artifact

## Image Promotion Flow
```
Build → microbank/nginx:dev (local repo, dev tag)
        ↓ (QA approval)
        microbank/nginx:sit (promoted, retag)
        ↓ (UAT approval)
        microbank/nginx:uat (promoted, retag)
        ↓ (Release Manager approval)
        microbank/nginx:prod (promoted, retag)
```

## Cleanup Policies
- Keep last 5 versions of each image per environment
- Delete images older than 90 days from dev
- Never auto-delete production images

## Security Scanning
- All images scanned with Trivy/Xray before promotion
- CRITICAL vulnerabilities block promotion
- HIGH vulnerabilities require security team approval
EOF
```

**Task 4: Cloud concepts overview** ⏱️ ~60 min

```bash
cat << 'EOF' > docs/cloud-basics.md
# Cloud Concepts for MicroBank

## Why Cloud?
Banks are migrating to cloud for:
- Scalability: handle more customers during peak hours
- Reliability: multiple data centers, automatic failover
- Cost: pay for what you use, no upfront hardware purchase

## Major Cloud Providers
- **AWS (Amazon)**: Most popular, most services
- **Azure (Microsoft)**: Popular with enterprises using Microsoft stack
- **GCP (Google)**: Strong in data analytics and Kubernetes (GKE)

## Key Services (using AWS names as example)

| Service | AWS Name | What It Does |
|---------|----------|--------------|
| Virtual Machine | EC2 | A computer in the cloud |
| Container Service | EKS | Managed Kubernetes cluster |
| Database | RDS | Managed PostgreSQL/MySQL |
| Object Storage | S3 | File storage (backups, logs) |
| Identity | IAM | Access control (who can do what) |
| Networking | VPC | Private network for your resources |
| Registry | ECR | Private Docker image registry |

## How MicroBank Would Deploy to Cloud
1. Create a VPC (private network)
2. Create an EKS cluster (managed Kubernetes)
3. Push images to ECR (private registry)
4. Deploy using Helm to EKS
5. Set up monitoring (CloudWatch or Prometheus)
6. Configure IAM roles for least privilege

## For Your Learning (Free Tiers)
- AWS: 12-month free tier — t2.micro EC2, 750 hours/month
- GCP: $300 credit for 90 days
- Azure: $200 credit for 30 days + always-free services
EOF
```

**Task 5: Commit** ⏱️ ~10 min

```bash
git add .
git commit -m "Add Artifactory docs, Trivy scanning, and cloud concepts overview"
git push github main
git push gitlab main
```

#### Self-Test
1. What are the three types of repositories in Artifactory?
2. Why do banks use private artifact repositories instead of Docker Hub?
3. What does Trivy do and why is it important in a CI/CD pipeline?
4. Name 3 cloud services and what they do.
5. What is the image promotion flow from dev to production?

#### Interview Angle
**Q: "What is Artifactory?"**
A: "Artifactory is a universal artifact repository manager. It stores Docker images, JAR files, Helm charts, and other build artifacts. It has local repositories for our own artifacts, remote repositories that cache external sources like Docker Hub, and virtual repositories that combine both. We use it in our CI/CD pipeline — the build stage pushes artifacts to Artifactory, and the deploy stage pulls from it."

---

## Week 6: Monitoring, Documentation & Capstone

> This week's goal: Add monitoring to MicroBank, create professional documentation and a presentation, and demonstrate the complete pipeline end-to-end.

---

### Phase 12: Monitoring & Observability (Days 1-3)

**Goal:** Deploy Prometheus and Grafana to monitor MicroBank and understand key metrics.

**Why this matters for the job:** Monitoring is how you know if something is wrong before users report it. The JD mentions understanding SDLC including operations — monitoring is the core of operations.

**⏱️ Total: ~18 hours across 3 days**

#### Concepts to Learn First

**What is monitoring?**
Collecting and visualizing data about your application's health: Is it running? Is it fast? Are there errors? Monitoring answers these questions in real-time.

**What is Prometheus?**
An open-source monitoring system. It collects metrics (numbers over time) from your applications by "scraping" — periodically requesting data from endpoints like `/actuator/health` or `/metrics`.

**What is Grafana?**
A visualization tool. It connects to Prometheus and displays metrics as beautiful dashboards — graphs, gauges, tables. You'll see things like "requests per second" and "error rate" as live charts.

**Key metrics to understand:**
- **Request rate** — how many requests per second
- **Error rate** — percentage of requests that fail
- **Latency** — how long requests take (p50, p95, p99)
- **Saturation** — how full are resources (CPU, memory, disk)

These four are called the "Four Golden Signals" of monitoring.

#### Tasks

**Task 1: Deploy Prometheus with Helm** ⏱️ ~60 min

```bash
# Add the Prometheus community Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install Prometheus + Grafana stack
helm install monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring --create-namespace \
  --set grafana.adminPassword=microbank2024

# Wait for pods to start
kubectl get pods -n monitoring -w
# Wait until all pods show Running/Ready

# Access Grafana
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring &
# Open http://localhost:3000
# Login: admin / microbank2024
```

**Task 2: Explore Grafana** ⏱️ ~45 min

```
# In Grafana (http://localhost:3000):
# 1. Click the hamburger menu → Dashboards
# 2. Browse pre-built dashboards:
#    - "Kubernetes / Compute Resources / Namespace"
#    - "Kubernetes / Compute Resources / Pod"
# 3. Select namespace: microbank-dev
# 4. Observe CPU, memory, network metrics for your pods
```

**Task 3: Create a MicroBank status dashboard concept** ⏱️ ~30 min

📝 Write what your ideal MicroBank dashboard would show:

```bash
cat << 'EOF' > docs/monitoring-dashboard.md
# MicroBank Monitoring Dashboard

## Overview Panel
- Total requests per second (all services)
- Overall error rate (percentage)
- Active pod count vs desired

## Per-Service Panels
For each of: Account Service, Transaction Service, Nginx

| Metric | PromQL Query Concept | Alert Threshold |
|--------|---------------------|-----------------|
| Request rate | rate(http_requests_total[5m]) | N/A |
| Error rate | rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m]) | > 5% for 5 min |
| Latency (p95) | histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) | > 2 seconds |
| Memory usage | container_memory_usage_bytes | > 80% of limit |
| CPU usage | rate(container_cpu_usage_seconds_total[5m]) | > 80% of limit |

## Database Panel
- Active connections
- Query latency
- Disk usage

## SLI/SLO Targets (Service Level Indicators / Objectives)
- **Availability SLO**: 99.9% uptime (max 43 min downtime/month)
- **Latency SLO**: 95% of requests complete within 500ms
- **Error Rate SLO**: Less than 0.1% of requests return 5xx errors
EOF
```

**Task 4: Commit** ⏱️ ~10 min

```bash
git add .
git commit -m "Add monitoring setup with Prometheus/Grafana and dashboard documentation"
git push github main
git push gitlab main
```

#### Self-Test
1. What are the "Four Golden Signals" of monitoring?
2. What does Prometheus do? What does Grafana do? How do they work together?
3. What is an SLO? Give an example for MicroBank.
4. Why is monitoring important for a DevOps engineer?

---

### Phase 13: Capstone — Full Integration & Presentation (Days 4-7)

**Goal:** Demonstrate end-to-end mastery by running the complete MicroBank pipeline and creating a professional handoff presentation for an Ops team.

**Why this matters for the job:** The JD says "Furnizezi prezentari catre echipele care vor functiona in OPS" and requires understanding the full SDLC. This capstone proves you can do both.

**⏱️ Total: ~24 hours across 4 days**

#### Tasks

**Task 1: Complete pipeline walkthrough** ⏱️ ~120 min

Run through the entire flow from scratch, documenting each step:

1. Clone the repository fresh
2. Review the code structure
3. Build Docker images locally
4. Run Docker Compose locally — verify it works
5. Push to GitLab — watch CI pipeline run
6. Apply K8s manifests to Minikube
7. Run Ansible playbook
8. Check monitoring dashboards

Document the time each step takes and any issues you encounter.

**Task 2: Perform a rolling update** ⏱️ ~60 min

```bash
# Change the Nginx configuration (simulate a code change)
cd ~/microbank-project
echo "# Updated for v2" >> nginx/nginx.conf
git add . && git commit -m "Update Nginx config to v2"
git push gitlab main

# Watch the GitLab pipeline run
# Then update the Kubernetes deployment
kubectl set image deployment/nginx nginx=microbank/nginx:v2 -n microbank-dev

# Watch the rolling update
kubectl rollout status deployment/nginx -n microbank-dev
```

**Task 3: Perform a rollback** ⏱️ ~30 min

```bash
# Check rollout history
kubectl rollout history deployment/nginx -n microbank-dev

# Rollback to previous version
kubectl rollout undo deployment/nginx -n microbank-dev

# Verify
kubectl rollout status deployment/nginx -n microbank-dev
```

**Task 4: Create the Ops handoff presentation** ⏱️ ~120 min

📝 This is the "furnizezi prezentari catre echipele OPS" task:

```bash
cat << 'EOF' > docs/ops-handoff-presentation.md
# MicroBank — Operations Handoff Document

## 1. Application Overview
MicroBank is a banking microservices application consisting of:
- **Account Service** (Java/Spring Boot) — manages bank accounts
- **Transaction Service** (Java/Spring Boot) — handles money transfers
- **PostgreSQL 15** — relational database
- **Nginx** — API gateway / reverse proxy

## 2. Architecture Diagram
```
[Client] → [Nginx :80] → [Account Service :8080] → [PostgreSQL :5432]
                       → [Transaction Service :8081] ↗
```

## 3. Deployment Information
| Component | Image | Replicas (Prod) | Port | Health Endpoint |
|-----------|-------|-----------------|------|-----------------|
| Account Service | registry/microbank/account-service | 3 | 8080 | /actuator/health |
| Transaction Service | registry/microbank/transaction-service | 3 | 8081 | /actuator/health |
| Nginx | registry/microbank/nginx | 2 | 80 | /health |
| PostgreSQL | postgres:15-alpine | 1 | 5432 | pg_isready |

## 4. Key Operational Procedures

### Starting the Application
```bash
helm install microbank ./helm/microbank -f values-prod.yaml -n microbank-prod
```

### Stopping the Application
```bash
helm uninstall microbank -n microbank-prod
```

### Health Check
```bash
./scripts/health-check.sh http://microbank.example.com/health 5 10
```

### Database Backup
```bash
kubectl exec -n microbank-prod deploy/postgres -- pg_dump -U microbank_user microbank > backup_$(date +%Y%m%d).sql
```

### Rollback Procedure
```bash
helm rollback microbank -n microbank-prod
```

## 5. Monitoring
- **Dashboard**: Grafana at https://grafana.example.com
  - Dashboard: "MicroBank Overview"
- **Alerts**: Configured for error rate > 5% and latency > 2s
- **Logs**: `kubectl logs -f deploy/account-service -n microbank-prod`

## 6. Troubleshooting

| Symptom | Likely Cause | Action |
|---------|-------------|--------|
| 502 Bad Gateway | Backend service down | Check pod status: `kubectl get pods -n microbank-prod` |
| Slow responses | DB queries slow or high CPU | Check Grafana CPU/memory panels, check DB connections |
| Pod CrashLoopBackOff | Configuration error or OOM | Check logs: `kubectl logs <pod-name>`, check events: `kubectl describe pod` |
| ImagePullBackOff | Image not in registry or wrong tag | Verify image exists in Artifactory, check image name and tag |

## 7. Contact Information
- **DevOps Team**: devops@microbank.example.com
- **On-call Rotation**: See PagerDuty/OpsGenie schedule
- **Escalation**: DevOps Lead → Infrastructure Manager → CTO

## 8. Change Management
All changes require an approved Change Request (CR). See `docs/change-request-template.md`.
EOF
```

**Task 5: Final project documentation** ⏱️ ~60 min

```bash
cat << 'EOF' > docs/project-final-summary.md
# MicroBank DevOps Project — Final Summary

## What I Built
A complete DevOps pipeline for a banking microservices application:

1. **Version Control**: Git repositories on both GitHub and GitLab
2. **Containerization**: Multi-stage Docker builds for all services
3. **Local Development**: Docker Compose stack with PostgreSQL, 2 Java services, Nginx
4. **CI/CD Pipeline**: GitLab CI with 5 stages (validate, build, test, package, deploy) + GitHub Actions
5. **Kubernetes Deployment**: Full K8s manifests + Helm chart with environment-specific values
6. **Configuration Management**: Ansible roles with templates and encrypted secrets
7. **Artifact Management**: Image scanning with Trivy, promotion workflow documentation
8. **Monitoring**: Prometheus + Grafana stack with dashboard design
9. **Documentation**: Runbooks, change request templates, Ops handoff document

## Skills Demonstrated
- Linux terminal, Bash scripting, YAML configuration
- Git workflows (branching, PRs, conflict resolution) on GitHub + GitLab
- Docker (images, containers, Compose, multi-stage builds, networking)
- Kubernetes (pods, deployments, services, configmaps, secrets, PVCs, probes)
- Helm (charts, values, environments)
- OpenShift concepts (Routes, SCCs, Projects)
- Ansible (playbooks, roles, templates, vault)
- Artifactory concepts and artifact lifecycle
- CI/CD pipeline design and implementation
- Monitoring with Prometheus and Grafana
- Security scanning with Trivy
- Enterprise practices: change management, approval gates, runbooks, delivery management
- Documentation and Ops handoff presentations

## SDLC Coverage
| SDLC Phase | MicroBank Implementation |
|------------|--------------------------|
| Plan | Architecture docs, requirements |
| Develop | Git workflows, branching strategy |
| Build | Docker multi-stage builds, Maven |
| Test | CI pipeline lint + test stages |
| Release | Approval gates, change requests |
| Deploy | K8s/Helm, Ansible, CI/CD deploy stage |
| Operate | Runbooks, monitoring, rollback procedures |
| Monitor | Prometheus, Grafana, alerting |
EOF

git add .
git commit -m "Add capstone deliverables: Ops handoff, final summary, pipeline walkthrough"
git push github main
git push gitlab main
```

**Task 6: Final self-assessment against the JD** ⏱️ ~30 min

📝 Re-read the target job description. For each bullet point, write:
- What you learned and built
- A concrete example from MicroBank
- A sentence you'd say in an interview about it

#### Capstone Self-Test
1. Walk through the entire MicroBank deployment pipeline from `git push` to running in Kubernetes.
2. A pod is in CrashLoopBackOff. Describe your debugging steps.
3. Explain the difference between Docker Compose and Kubernetes to a project manager.
4. What is a Change Request and why is it required at a bank?
5. Describe the image promotion flow from DEV to PROD.
6. Your monitoring dashboard shows error rate at 8%. What do you do?

---

## Appendix A: Tool Installation Reference

| Tool | Install Command | Verify |
|------|----------------|--------|
| Git | `sudo apt install -y git` | `git --version` |
| Docker | See Phase 4 setup | `docker --version` |
| Docker Compose | Included with Docker | `docker compose version` |
| kubectl | See Phase 8 setup | `kubectl version --client` |
| Minikube | See Phase 8 setup | `minikube version` |
| Helm | See Phase 9 setup | `helm version` |
| Ansible | `sudo apt install -y ansible` | `ansible --version` |
| yamllint | `pip install yamllint` | `yamllint --version` |
| shellcheck | `sudo apt install -y shellcheck` | `shellcheck --version` |
| jq | `sudo apt install -y jq` | `jq --version` |
| Trivy | See Phase 11 setup | `trivy --version` |

## Appendix B: Troubleshooting Common Issues

**WSL2 Issues:**
- "WSL2 requires an update": Run `wsl --update` in PowerShell
- Docker not starting in WSL2: Install Docker Desktop for Windows and enable WSL2 integration

**Docker Issues:**
- "Cannot connect to Docker daemon": `sudo systemctl start docker` or restart WSL2
- "No space left on device": `docker system prune -a` (warning: deletes unused images)

**Kubernetes Issues:**
- Minikube won't start: `minikube delete && minikube start --memory=4096`
- kubectl can't connect: `minikube status` and check if cluster is running

**Git Issues:**
- SSH key not working: `ssh -T git@github.com` to test, check `~/.ssh/id_ed25519.pub` is added to GitHub/GitLab
- Can't push: `git pull` first, resolve conflicts

## Appendix C: Recommended Resources

**Linux & Bash:**
- The Linux Command Line (free book): https://linuxcommand.org/tlcl.php

**Docker:**
- Docker official getting started: https://docs.docker.com/get-started/

**Kubernetes:**
- Kubernetes official tutorials: https://kubernetes.io/docs/tutorials/

**GitLab CI:**
- GitLab CI/CD documentation: https://docs.gitlab.com/ee/ci/

**Ansible:**
- Ansible getting started: https://docs.ansible.com/ansible/latest/getting_started/

## Appendix D: Advanced Git (Reference)

These commands are useful but not required for a junior role:
- `git rebase` — rewrite commit history (use with caution on shared branches)
- `git cherry-pick` — copy a specific commit from one branch to another
- `git stash` — temporarily save uncommitted changes
- `git reflog` — recover from mistakes (shows ALL recent actions)
- `git bisect` — find which commit introduced a bug (binary search)

---

## Change Log

Summary of every major change from the original plan and the rationale:

**Structural Changes:**
- **Added Phase 0 (SDLC & DevOps overview)** — The JD explicitly requires "ciclul de viata al dezvoltarii software." The original plan jumped straight into Linux with no context. A true beginner needs to understand WHY before HOW.
- **Merged advanced scripting into Phase 7 with delivery management** — Original Phase 7 was pure scripting. Added change request templates, runbooks, and approval gate concepts because the JD requires "management al procesului de livrare a software-ului."
- **Added GitHub alongside GitLab throughout** — Original plan was GitLab-only. The JD explicitly asks for both. Every phase now pushes to both remotes, and Phase 6 includes GitHub Actions.
- **Added Ops handoff presentation in Capstone** — The JD says "furnizezi prezentari catre echipele OPS." This was completely absent.

**Content Added:**
- **SDLC module** — Covers all 8 stages with MicroBank mapping. ❌ was missing.
- **OpenShift comparison document** — Expanded from one bullet to a full comparison with code examples of Routes vs Ingress, SCC explanation, and migration notes. ⚠️ was a single bullet.
- **Artifactory concepts guide** — Expanded from "set up a local registry" to full documentation of local/remote/virtual repos, promotion flows, and cleanup policies. ⚠️ was superficial.
- **Change Request template** — Enterprise banks require formal CRs. ❌ was missing.
- **Deployment runbook** — Step-by-step operational document. Was mentioned but not created.
- **Cloud basics overview** — JD mentions "mediu cloud." ❌ was completely absent.
- **"Teach-back" exercises** — 4 phases include "explain to a non-technical colleague" tasks, practicing the presentation skill the JD requires.
- **Mid-project review (end of Week 3)** — Documentation practice checkpoint.
- **Interview Angle sections** — Every phase now includes example interview Q&A specific to that topic.
- **Java/Maven/JRE/JAR explanations** — Added before Docker Phase 4. Original assumed knowledge of Java ecosystem.

**Content Cut or Compressed:**
- **`git bisect`, `git reflog`, `git cherry-pick`** → Moved to Appendix D. Rarely used by juniors, not in JD.
- **`awk` deep dive** → Removed entirely. `grep` + basic `sed` is sufficient for the JD.
- **YAML anchors & aliases** → Removed. Advanced YAML rarely used by juniors.
- **Distroless image comparison** → Removed. Interesting but not JD-relevant.
- **Loki/Promtail deep dive** → Compressed to basic monitoring with existing Docker/K8s logs.
- **HashiCorp Vault setup** → Reduced to a mention in Artifactory docs. Not in JD.
- **Sealed Secrets** → Removed entirely. Too advanced, not in JD.
- **`asciinema` recording** → Replaced with written deployment report (more job-relevant).
- **Blue-green deployment scripting** → Simplified to rolling update + rollback (what juniors actually do).
- **NetworkPolicy debugging** → Removed. Too advanced for first 6 months.

**Pacing Changes:**
- **Week 1 is gentler** — Phase 0 (concepts only) gives a soft start. Day 1 produces visible wins within 30 minutes.
- **Bash scripting provides complete scripts** — Original said "write a script that does X." True beginners can't do this. Now provides 80%+ complete scripts with inline comments, asks learner to modify/extend.
- **YAML provides complete templates** — Never asks "write a K8s manifest from scratch" without a template.
- **Added explicit "take a break" markers** after cognitively heavy sections.
- **Each day ends with something showable** — "look, I deployed this," "look, my pipeline ran."
- **Reduced Phase 3 scope** — Cut awk, advanced YAML, and reduced sed to basics. Original was 3 days for YAML + full Bash from zero — unrealistic.

**Assessment Changes:**
- **Every verification now includes a debugging exercise** — Original verifications mostly proved "it runs." Now they prove "I can fix it when it breaks."
- **Added "explain in your own words" questions** — Tests understanding, not just command memorization.
- **Added "teach-back" tasks** — Mirrors the JD's presentation requirement.
- **Checkpoints include broken configs to fix** — Tests troubleshooting, the #1 junior DevOps skill.

**Cognitive Load Fixes:**
- **Added "Concepts to Learn First" section to every phase** — Explains all technical terms BEFORE tasks use them.
- **Java/Maven/JRE explained in Phase 4** — Before touching Dockerfiles for Java apps.
- **DNS explained before Docker networking** — Before containers communicate by name.
- **Package manager concept explained before Helm** — Before "Helm is a package manager for K8s."
- **Every code block has inline comments** — No unexplained commands.
- **Max 3 new concepts per phase** — Follows cognitive load research.

**Enterprise Realism Additions:**
- **Environment names: DEV → SIT → UAT → PREPROD → PROD** — Banks don't use just "dev/staging."
- **Change management workflow** — All changes require CRs with approvals.
- **Image promotion with validation** — Can't skip environments.
- **Documentation culture** — Learning journal, runbooks, handoff docs.
- **Approval gates with multiple roles** — Dev Lead, QA Lead, Release Manager, Security.
- **Commit message conventions with ticket references** — `JIRA-1234: description`.
