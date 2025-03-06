#!/bin/bash

# Define volumes
VOLUMES=(
  "server_arcade_emulatorjs_config"
  "server_arcade_emulatorjs_data"
  "server_auth_authentik_postgresql"
  "server_auth_authentik_postgresql_dumps"
  "server_auth_authentik_redis"
  "server_auth_authentik_redis_dumps"
  "server_auth_authentik_server_media"
  "server_auth_authentik_server_templates"
  "server_auth_authentik_server_certs"
  "server_backup_docker_volume_backup"
  "server_backup_duplicati_config"
  "server_docker_portainer_data"
  "server_downloader_gluetun_data"
  "server_downloader_qbittorrent_config"
  "server_downloader_nzbget_config"
  "server_htpc_prowlarr_config"
  "server_htpc_sonarr_config"
  "server_htpc_radarr_config"
  "server_htpc_plex_config"
  "server_metrics_grafana_data"
  "server_metrics_grafana_provisioning"
  "server_metrics_prometheus_data"
  "server_traefik_letsencrypt"
)

# Define networks
NETWORKS=(
  "traefik_proxy"
  "socket_proxy"
  "metrics"
)

# Create Docker volumes if they do not exist
echo -e "🛠  Creating Docker volumes..."
for volume in "${VOLUMES[@]}"; do
  if ! docker volume inspect "$volume" &>/dev/null; then
    docker volume create "$volume"
    echo -e "\t✅ Created volume: $volume"
  else
    echo -e "\t⚡ Volume already exists: $volume"
  fi
done

# Create Docker networks if they do not exist
echo -e "\n🌐 Creating Docker networks..."
for network in "${NETWORKS[@]}"; do
  if ! docker network inspect "$network" &>/dev/null; then
    docker network create "$network"
    echo -e "\t✅ Created network: $network"
  else
    echo -e "\t⚡ Network already exists: $network"
  fi
done

echo -e "\n🚀 Initialization complete!"
echo -e "\n🔎 Review volumes user:group if needed"
