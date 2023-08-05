```bash
# setting your username and password in Dockerfile
# edit Dockerfile

# build
docker build -t $(basename $(pwd)) .

# run
docker run -d -p 2023:22 $(basename $(pwd))

# connect
ssh [USERNAME]@localhost -p 2023
```