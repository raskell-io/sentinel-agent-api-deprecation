# syntax=docker/dockerfile:1.4

# Sentinel API Deprecation Agent Container Image
#
# Targets:
#   - prebuilt: For CI with pre-built binaries

################################################################################
# Pre-built binary stage (for CI builds)
################################################################################
FROM gcr.io/distroless/cc-debian12:nonroot AS prebuilt

COPY sentinel-agent-api-deprecation /sentinel-agent-api-deprecation

LABEL org.opencontainers.image.title="Sentinel API Deprecation Agent" \
      org.opencontainers.image.description="Sentinel API Deprecation Agent for Sentinel reverse proxy" \
      org.opencontainers.image.vendor="Raskell" \
      org.opencontainers.image.source="https://github.com/raskell-io/sentinel-agent-api-deprecation"

ENV RUST_LOG=info,sentinel_agent_api_deprecation=debug \
    SOCKET_PATH=/var/run/sentinel/api-deprecation.sock

USER nonroot:nonroot

ENTRYPOINT ["/sentinel-agent-api-deprecation"]
