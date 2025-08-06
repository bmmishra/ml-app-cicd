# Use maintained base image
FROM python:3.10-slim-bookworm

# Set working directory
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy all files into the image
COPY . /code

# Install Python dependencies
RUN pip install --no-cache-dir -r /code/requirements.txt

# Set environment variable (optional if you need module-level imports)
ENV PYTHONPATH=/code

# Expose the port (if using a Flask/FastAPI app etc.)
EXPOSE 8005

# Default command: Run main application
CMD ["python", "main.py"]
