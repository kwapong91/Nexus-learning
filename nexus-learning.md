# What is Nexus Repository Manager?
Nexus Repository Manager is a tool that helps companies store, manage, and share build artifacts like .jar, .war, and Docker images. These are files produced during the software build process — called artifacts — and Nexus acts as a central hub to organize and control them, especially in CI/CD pipelines.

Companies use Nexus to:

* Host internal Docker registries
* Cache public dependencies (Maven, npm, etc.)
* Improve build performance and stability
* Secure and version internal builds

# 🧠 My Learning Notes

## What are artifacts?
They're files produced from a build process — like .war, .jar, or Docker images.

## Initial issues I ran into:
I tried downloading Nexus for Mac (Apple Silicon) and kept getting a 404 and login prompt. Tried using curl -L0 "<link>" and got the same. After researching, I found others were having the same issue. Likely a CDN issue on Sonatype's side (GPT-4 said so 😊).

## Workaround:
I found a Docker image for Nexus on Docker Hub and ran it locally:

```bash
docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```

To get the admin password:

```bash
docker exec -it nexus cat /nexus-data/admin.password
```

## Error I ran into:
I got a timeout error pushing images. Turned out I had exposed port 8081 for the UI, but forgot to expose 5000, which I used for my Docker (hosted) repo. Restarted Nexus with the correct ports and it worked. 


This markdown file was completely generated with cursor after I gave Claude the google doc notes I was taking along the way😊
Cool tool :)