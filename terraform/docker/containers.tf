# Start newsfeed container
resource "docker_container" "newsfeed" {
    image = "${docker_image.newsfeed.latest}"
    name = "newsfeed"
    hostname = "newsfeed"
    env = ["APP_PORT=8002"]
    command = ["java", "-jar", "/root/newsfeed.jar"]
    restart= "no"
    ports {
    internal = 8002
    external = 8002
   }
    must_run="true"
}

# Find the newfeed image.
resource "docker_image" "newsfeed" {
  name = "ranjithruban/newsfeed:latest"
}

# Start quotes container
resource "docker_container" "quotes" {
    image = "${docker_image.quotes.latest}"
    name = "quotes"
    hostname = "quotes"
    env = ["APP_PORT=8001"]
    command = ["java", "-jar", "/root/quotes.jar"]
    restart= "no"
    ports {
    internal = 8001
    external = 8001
   }
    must_run="true"
}

# Find the quotes image.
resource "docker_image" "quotes" {
  name = "ranjithruban/quotes:latest"
}

# Start static-asset container
resource "docker_container" "static-assets" {
    image = "${docker_image.static-assets.latest}"
    name = "static-assets"
    hostname = "static-assets"
    env = ["APP_PORT=8000"]
    command = ["/root/serve.py"]
    restart= "no"
    ports {
    internal = 8000
    external = 8000
   }
    must_run="true"
}

# Find the static-assets image.
resource "docker_image" "static-assets" {
  name = "ranjithruban/static-assets:latest"
}

# Start frontend container
resource "docker_container" "frontend" {
    image = "${docker_image.frontend.latest}"
    name = "frontend"
    hostname = "frontend"
    env = [
    "APP_PORT=8003",
    "STATIC_URL=http://static-assets:8000",
    "QUOTE_SERVICE_URL=http://quotes:8001",
    "NEWSFEED_SERVICE_URL=http://newsfeed:8002",
    "NEWSFEED_SERVICE_TOKEN=T1&eWbYXNWG1w1^YGKDPxAWJ@^et^&kX"
    ]
    command = ["java", "-jar", "/root/front-end.jar"]
    restart= "no"
    ports {
    internal = 8003
    external = 8003
    }
    links = [
    "${docker_container.newsfeed.name}",
    "${docker_container.quotes.name}",
    "${docker_container.static-assets.name}"
  ]
    must_run="true"
}

# Find the newfeed image.
resource "docker_image" "frontend" {
  name = "ranjithruban/frontend:latest"
}

