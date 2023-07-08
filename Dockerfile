ARG SYNCTHING_VERSION=latest
FROM syncthing/syncthing:${SYNCTHING_VERSION}

# Set an environment variable to point at a directory where Syncthing should
# look for GUI asset overrides. This directory should follow the same layout
# as what you see underneath
# https://github.com/syncthing/syncthing/tree/main/gui.
ENV STGUIASSETS=/usr/share/syncthing/gui

# Copy out asset overrides, in this case overriding the default theme.
# Assets from the default theme are used in the other themes as well if
# there are no more specific overrides there, so replacing for example the
# logo here will apply to all themes.
COPY default /usr/share/syncthing/gui/default
