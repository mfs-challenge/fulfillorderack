## Build stage
FROM golang:1.9.4 
# Set the working directory to the app directory
WORKDIR /go/src/fulfillorderack

# Install godeps
RUN go get -u -v github.com/astaxie/beego
RUN go get -u -v github.com/beego/bee
RUN go get -d github.com/Microsoft/ApplicationInsights-Go/appinsights
RUN go get -u -v gopkg.in/mgo.v2
RUN go get gopkg.in/matryer/try.v1


WORKDIR /go/src/fulfillorderack
# Copy the application files
COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o fulfillorderack .

# Define environment variables
# Application Insights
ENV APPINSIGHTS_KEY=
ENV CHALLENGEAPPINSIGHTS_KEY=

# Challenge Logging
ENV TEAMNAME=

# Mongo/Cosmos
ENV MONGOURL=

# Expose the application on port 8080
EXPOSE 8080

# Set the entry point of the container to the bee command that runs the
# application and watches for changes
CMD ["./fulfillorderack", "run"]
