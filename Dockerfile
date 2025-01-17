# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:1.17.0

# Add Maintainer Info
LABEL maintainer="Nadir Hamid <matrix.nad@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

#RUN echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
#RUN git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 80 to the outside world
EXPOSE 80
# for K8s and other environments
EXPOSE 8010

# Command to run the executable
CMD ["./main"]
