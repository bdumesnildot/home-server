# HOME SERVER

This home server setup provides a collection of self-hosted services for media streaming, authentication, and emulation. It uses **Docker Compose** to manage and deploy the services efficiently.

## SERVICES

### TRAEFIK 🚦

- **[Traefik](https://traefik.io/)**: Reverse proxy with SSL support for managing and securing your web services.


### DOCKER 🐳

- **[Docker socket proxy](https://docs.linuxserver.io/images/docker-socket-proxy/)**: Security-enhanced proxy which allows you to apply access rules to the Docker socket
- **[Portainer CE](https://docs.portainer.io/)**: Toolset that allows you to easily build and manage containers in Docker


### AUTH 🔐

- **[Authentik](https://goauthentik.io/)**: IdP (Identity Provider) and SSO (single sign on)


### HTPC 🎬

- **[Plex Media Server](https://www.plex.tv/)**: Manage and serve media files to Plex clients.
- **[Prowlarr](https://prowlarr.com/)**: Indexer management for Usenet and torrents.
- **[Sonarr](https://sonarr.tv/)**: Automated TV series management.
- **[Radarr](https://radarr.video/)**: Automated movie management.


### DOWNLOADER 📥

- **[Gluetun](https://github.com/qdm12/gluetun)**: VPN client supporting multiple VPN service providers for secure connections.
- **[qBittorrent](https://www.qbittorrent.org/)**: Torrent client for downloading and managing torrent files.
- **[NZBget](https://nzbget.net/)**: Usenet downloader for managing and downloading Usenet content.


### ARCADE 🕹️
- **[EmulatorJs](https://emulatorjs.org/)**: Embed emulator, runs RetroArch compiled to webassembly, optimized for running in the web browser.


### BACKUP 🛟
- **[Offen/docker-volume-backup](https://offen.github.io/docker-volume-backup/)**: Backup Docker volumes locally with pre backup exec commands and stop/restart container management.
- **[Duplicati](https://docs.duplicati.com/)**: Backup services, use to duplicates archives in cloud storages.


## SETUP

1. **Install Docker and Docker Compose**:

   Ensure Docker and Docker Compose are installed on your system. Follow the official installation guides for your operating system.

2. **Create and Configure `.env` File**:

   Copy the `.env.example` template to `.env`.

   Fill in the necessary environment variables in the `.env` file.

3. **Create Shared Docker Networks**:

   Define the shared networks required for inter-service communication.

   ```sh
   docker network create traefik-public
   docker network create internal
   ```

4. **Create Shared Docker Volumes**:

   Set up the shared volumes for persistent data storage.

  ```sh
   docker volume create 
   ```

5. **Deploy Services**:

   Run the following command to start all services:

   ```sh
   docker compose up -d
   ```

5. **Access and Setup Services**:

    Once the services are up and running, you can access them via the configured URLs or ports.

    Authentik Setup: It is recommended to set up Authentik via auth.<your-domain> as it handles the common authentication logic for your services.


<br>
<br>


---

### Disclaimer ❗️

**Responsibility**: By using this setup, you acknowledge and agree that you are solely responsible for:

- Ensuring compliance with all applicable laws and regulations, including copyright laws.
- Configuring and securing your services to prevent unauthorized access.
- Managing and backing up your data.

**No Warranty**: This setup is provided as-is, without any warranty. The maintainers are not responsible for any data loss, security breaches, or legal issues that may arise from its use.

Use this setup responsibly and at your own risk.