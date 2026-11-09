
if [ "$#" -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

set -e

GITHUB_REPO=$1
DOCKER_IMAGE=$2

# Clone the GitHub repository
git clone "https://github.com/$GITHUB_REPO.git"

# Enter the cloned repository
REPO_NAME=$(basename "$GITHUB_REPO")
cd "$REPO_NAME"

# Build the Docker image
docker build -t "$DOCKER_IMAGE" .

# Push the image to Docker Hub
docker push "$DOCKER_IMAGE"