#!/usr/bin/env pwsh

# Define Colors for output
$Magenta = "`e[0;35m"
$Green = "`e[0;32m"
$Red = "`e[0;31m"
$NC = "`e[0m"

# Function to show the banner
function Show-Banner {
    Write-Host "${Magenta}=====================${NC}"
    Write-Host "${Magenta}Docker Cleanup Script${NC}"
    Write-Host "${Magenta}1. Stop and remove all running containers${NC}"
    Write-Host "${Magenta}2. Remove all Docker images${NC}"
    Write-Host "${Magenta}3. Remove all Docker volumes${NC}"
    Write-Host "${Magenta}4. Remove all Docker networks${NC}"
    Write-Host "${Magenta}5. Prune all unused Docker resources ${NC}"
    Write-Host "${Magenta}=====================${NC}"
    Write-Host ""
}

# Function to check if Docker is installed
function Check-DockerInstalled {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        Write-Host "${Red}Docker is not installed or not in the system path.${NC}"
        exit 1
    }
}

# Docker cleanup logic
function Remove-DockerResources {
    Try {
        # Stop and remove all running containers
        $containers = docker ps -aq
        if ($containers) {
            Write-Host "${Magenta}Stopping and removing containers...${NC}"
            docker stop $containers | Out-Null
            docker rm $containers | Out-Null
            Write-Host "${Green}Containers removed.${NC}"
        }
        else {
            Write-Host "${Red}No containers found.${NC}"
        }

        # Remove all Docker images
        $images = docker images -q
        if ($images) {
            Write-Host "${Magenta}Removing images...${NC}"
            docker rmi $images | Out-Null
            Write-Host "${Green}Images removed.${NC}"
        }
        else {
            Write-Host "${Red}No images found.${NC}"
        }

        # Remove all Docker volumes
        $volumes = docker volume ls -q
        if ($volumes) {
            Write-Host "${Magenta}Removing volumes...${NC}"
            docker volume rm $volumes | Out-Null
            Write-Host "${Green}Volumes removed.${NC}"
        }
        else {
            Write-Host "${Red}No volumes found.${NC}"
        }

        # Remove all Docker networks
        $networks = docker network ls -q
        if ($networks) {
            Write-Host "${Magenta}Removing networks...${NC}"
            docker network rm $networks | Out-Null
            Write-Host "${Green}Networks removed.${NC}"
        }
        else {
            Write-Host "${Red}No networks found.${NC}"
        }

        # Prune all unused Docker resources
        Write-Host "${Magenta}Pruning unused Docker resources...${NC}"
        docker system prune -af | Out-Null
        Write-Host "${Green}System pruned.${NC}"
    }
    Catch {
        Write-Host "${Red}An error occurred: $_${NC}"
    }
}

# xyizko banner
function Show-Xyizko {
    $url = "https://snips.sh/f/ZuwtQ3Pk0x?r=1"
    Try {
        $response = Invoke-RestMethod -Uri $url
        Write-Host $response
    }
    Catch {
        Write-Host "${Red}Failed to retrieve data from $url${NC}"
    }
}

# Main execution
Check-DockerInstalled
Show-Xyizko
Show-Banner
Remove-DockerResources
