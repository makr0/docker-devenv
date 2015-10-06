# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER <mdt@wegewerk.com>

# Install Samba
RUN apt-get update && apt-get install -y samba
# Copy config files
COPY *.txt /

# Adjust Samba configuration
RUN cat smb.txt >> /etc/samba/smb.conf && \
  # Stop Samba
  service smbd stop && \
  # Clean up
  rm *.txt

# Expose Samba ports
EXPOSE 137 138 139 445
# Run Samba in the foreground
CMD ["/usr/sbin/smbd", "-FS"]
