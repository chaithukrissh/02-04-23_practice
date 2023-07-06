APP_VERSION="1.0.0"

IMAGE_NAME="dynamic"


increment_version() {
  local version_parts=( ${1//./ } )  # Split version string into an array
  local major="${version_parts[0]}"
  local minor="${version_parts[1]}"
  local patch="${version_parts[2]}"
  
  # Increment the version based on your desired condition
  if [ condition_for_increment ]; then
    patch=$((patch+1))
  fi

  # Concatenate the version parts
  local new_version="$major.$minor.$patch"
  
  echo "$new_version"
}

# Increment the version if needed
NEW_VERSION=$(increment_version "$APP_VERSION")






# docker build --build-arg APP_VERSION="$APP_VERSION" --build-arg IMAGE_NAME="$IMAGE_NAME" -t "$IMAGE_NAME:$APP_VERSION" .
docker build --build-arg APP_VERSION="$NEW_VERSION" --build-arg IMAGE_NAME="$IMAGE_NAME" -t "$IMAGE_NAME:$NEW_VERSION" .