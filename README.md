## Hello and welcome!

This sandbox requires Docker and Python 3.9 or greater. A virtual Python environment is recommended!

Install dependencies:
```bash
pip install -e '.[dev]'
```
Run the service:
```bash
uvicorn --app-dir service main:service --reload
```
Run the tests:
```bash
pytest service
```
Access the service from your browser:

http://localhost:8000

Build a Docker image:
```bash
docker build -t sample-backend:$(git rev-parse --short HEAD) -t sample-backend:latest .
```
Run a corresponding container:
```bash
docker run --rm -it -p 8001:8001 sample-backend
```
Access the Dockerized service from your browser:

http://localhost:8001

## Challenges

Please complete the following challenges. Once a challenge is completed, commit it with an appropriate comment so we can find your work. 

1. The service provides an http endpoint - use the provided self-signed certificate and key (in the `localhost-cert` directory) to create an https endoint for the service. Update the README to describe how to do this and how to test that it works.

To create an https endpoint, we need to run the below command

uvicorn --app-dir service main:service --reload --host 0.0.0.0 --port 443 --ssl-keyfile C:\DevOps_Proj\Graticule_assignment\localhost-cert\key.pem --ssl-certfile C:\DevOps_Proj\Graticule_assignment\localhost-cert\cert.pem

I have given the path of cert files (C:\DevOps_Proj\Graticule_assignment\localhost-cert\key.pem) and ran it. We can also use localhost instead and run it from the folder where key and perm are located.

Once we run it, we can test the service using the url https://localhost:443 (443 is the default port for https).


2. By default, Docker containers run as root. Following the principle of least privilege, update the Dockerfile to run the service as a non-root user. 
3. Create a GitHub Actions workflow to run tests on each commit to the main branch. 
