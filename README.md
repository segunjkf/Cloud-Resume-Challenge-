# cloud-resume-challenge

This project is my online resume, a static web page, serving simple html & css I wrote from scratch to keep it clean.

Using "aws-vault", which helps me manage AWS profiles and store credentials securely, and GitHub actions is using secrets for this during CI/CD.




You can visit [my domain here](https://derk9hhun7u19.cloudfront.net/) which is the result of this project.

#### How this project works at the moment:
Any push to Main branch will trigger the GitHub actions I created which will:
* terraform init
* terraform apply (auto approve)
* S3 sync my website files (html & css)
* trigger Cypress tests which hit the API endpoint and validate the response (heartbeat check)

#### high level description of functionality
* S3 bucket hosts the website
* certificates and permissions configured in AWS Iam Policies
* Cloudfront used to meet https requirement and cache control
* DynamoDB and Lambda function used to implement visitor counter.
* JS used to retreive counter value from API and display on site
* APIGateway used to implement API endpoint

## High level design of major AWS pieces:
![AWS_Services_diagram drawio](https://user-images.githubusercontent.com/98762800/156835852-d4388868-afae-4ee7-91a6-139b3372e9c5.png)

All services were configured and provisioned by Terraform IaC code, from the beginning to end.




