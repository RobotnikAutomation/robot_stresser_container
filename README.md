# Robot Stresser Container

## Overview

The Robot Stresser Container is a Docker-based tool designed to stress test robot CPUs by simulating various workloads. It's essential for evaluating the performance and reliability of robotic systems under different conditions.

## Features

- Configurable base image and version
- Customizable CPU count for stress testing
- Tini integration as an init system
- Utilizes the `stress` tool (renamed to `ros2`) for system load generation
- Flexible command-line options for tailored stress tests

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/RobotnikAutomation/robot_stresser_container.git
   cd robot_stresser_container
   ```

2. Build and run the container:
   ```bash
   docker compose build
   docker compose up
   ```

## Usage

### Basic Stress Test

Run a basic stress test using Docker Compose:

```bash
docker compose up
```

### Custom Stress Test

Modify the `command` in `build.yaml` to customize the stress test parameters:

```yaml
command:
  - --timeout
  - "3"
  - --cpu
  - "1"
  - --vm-bytes
  - "10"
```

### Environment Variables

- `CPU`: Set the number of CPUs to stress (overrides the default)

### Entrypoint

The container uses an entrypoint script (`entrypoint.sh`) that allows for flexible command execution. If no arguments are provided, it defaults to stressing the number of CPUs specified by the `CPU` environment variable.

## Maintenance and License

- Maintainer: Guillem Gari <ggari@robotnik.es> from Robotnik Automation S.L.
- License: BSD-3-Clause
