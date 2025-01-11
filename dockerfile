# Install required packages
RUN apt-get update && apt-get install -y \
    postgresql-server-dev-all \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone and install pgvector
RUN git clone https://github.com/pgvector/pgvector.git /tmp/pgvector && \
    cd /tmp/pgvector && \
    make && make install && \
    rm -rf /tmp/pgvector

# Create a volume for persistence
VOLUME /var/lib/postgresql/data

# Default command
CMD ["postgres"]
