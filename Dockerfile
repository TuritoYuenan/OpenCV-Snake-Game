# Use the python image (alpine version for lightweight size)
FROM python:slim

# Deploy function in /app directory
WORKDIR /app

# Install mesa library
RUN apt -y update && \
	apt -y upgrade && \
	apt-get -y install mesa-utils libglib2.0-0 libsm6 libxrender1 libxext6 && \
	rm -rf /var/lib/apt/lists/*

# Import function code
COPY . .

# Install required packages
RUN python -m pip install --no-cache-dir -r requirements.txt

# Run the function
CMD [ "python", "main.py" ]
