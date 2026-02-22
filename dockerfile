FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y python3 python3-venv python3-pip
WORKDIR /app
COPY . .
RUN python3 -m venv /venv
RUN /venv/bin/pip install uvicorn fastapi
WORKDIR /app
CMD ["uvicorn", "service:app", "--host", "0.0.0.0", "--port", "8000"]
