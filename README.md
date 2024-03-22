# Terraform-Assignment
1) Create VPC , two subnets, Internet gateway associated with VPC and route table.
2) Create this as a module named vpc.
3) Create a new directory for EKS cluster.
4) Call this module in this main.tf present in the new directory named "TfAssignment".
5) In the provider.tf implement the backend code.
   ![Screenshot (234)](https://github.com/saiTA21/Terraform-Assignment/assets/152283229/1f617cd5-d50c-4686-877d-e29936c0ffd6)
6) Create an EKS cluster in the subnets that you have created.
![Screenshot (235)](https://github.com/saiTA21/Terraform-Assignment/assets/152283229/770cbf68-f72c-4a5b-a11f-cd59dba00640)
7) Make two workspaces for environments, name it "qa" and "default".
8) Create node group in this eks cluster with a desired state of one.
![Screenshot (236)](https://github.com/saiTA21/Terraform-Assignment/assets/152283229/7f26be5a-16d9-42c5-a139-7dc7ea1c31e3)
9) Check if the EC2 or the node is up and running.



