module github.com/abutaha/aws-es-proxy

go 1.23

require (
	github.com/aws/aws-sdk-go v1.55.6
	github.com/sirupsen/logrus v1.9.3
	go.mongodb.org/mongo-driver v1.17.2
	golang.org/x/net v0.34.0
)

require (
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	golang.org/x/sys v0.29.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c => gopkg.in/yaml.v3 v3.0.1
