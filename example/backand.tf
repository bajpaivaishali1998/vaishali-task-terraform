terraform {
  backend "s3"{
      bucket = "vaishali-1998-bajpai"
      key="sona.tfstate"
      dynamodb_table = "vaishali_table"
      region = "us-east-1"
      
  }
}

