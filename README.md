# Lab02Devops_C1
Triển khai hạ tầng AWS sử dụng Terraform và tự động hóa quy trình với GitHub Actions

Cách triển khai:

+B1: Thiết kế các modules cần thiết cho các resource trên AWS như VPC,Subnet,NAT GATEWAY,EC2
SECURITY GROUP

+B2: Trên AWS , ta cần phải tạo trước một Bucket S3 để lưu terraform.tfstate. Trong mã nguồn này, thay đổi tên (bucket_name) trong file provider.tf

+B3: Trên github, ở tab Setting tạo secrets and varable cho github action

+B4: Tạo folder .github/workflows

+B5: Tạo file deploy.yml trong folder workflows

+B6: Tiến hành git add . -> git commit -m "" -> git push origin main để thực hiện deploy các resource
trên AWS

LƯU Ý:
Nếu muốn destroy các resources trên AWS, ta thực hiện:

+B1: cd TF_LAB02

+B2: Dùng lệnh terraform init để tạo backend từ file terraform.tfstate trên S3

+B3: terraform destroy 


Để thay đổi IP cụ thể để SSH tới EC2 instances => Thay đổi giá trị của biến my_ip_address trong
file terrafrom.tfvars
