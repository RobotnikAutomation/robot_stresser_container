ARG base_image="use-args"
ARG image_base_version="use-args"
ARG default_cpu_count="use-args"
ARG tini_version="use-args"

FROM ${base_image}:${image_base_version}
LABEL maintainer="Guillem Gari <ggari@robotnik.es>" \
      org.opencontainers.image.title="robot-stresser" \
      org.opencontainers.image.version="${version}" \
      org.opencontainers.image.description="Robot Stresser" \
      org.opencontainers.image.source="https://github.com/RobotnikAutomation/robot_stresser_container.git" \
      org.opencontainers.image.vendor="Robotnik Automation S.L." \
      org.opencontainers.image.licenses="BSD-3-Clause" \
      org.opencontainers.image.authors="Guillem Gari <ggari@robotnik.es>"

ARG default_cpu_count
ARG tini_version
ARG tini_path=/usr/local/bin/tini
ARG tini_url=https://github.com/krallin/tini/releases/download

ENV DEBIAN_FRONTEND=noninteractive

RUN true \
	&& apt update \
	&& apt install -y stress wget \
	&& wget \
		"${tini_url}/v${tini_version}/tini-$(dpkg --print-architecture)" \
		-O ${tini_path} \
	&& chmod +x ${tini_path} \
	&& cp /usr/bin/stress /usr/bin/ros2 \
	&& apt remove wget -q -y \
	&& apt-get clean -q -y \
    && apt-get autoremove -q -y \
    && rm -rf /var/lib/apt/lists/* \
    && true

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

ENV CPU=${cpu_count}