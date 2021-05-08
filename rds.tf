resource "aws_db_instance" "main" {
  identifier = "${var.org}-${var.env}-rds"

  engine              = "postgres"
  engine_version      = "11.6"
  publicly_accessible = false
  instance_class      = "db.t3.micro"

  name     = var.rds_dbname
  username = var.rds_username
  password = var.rds_password

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  multi_az               = true

  storage_type          = "gp2"
  allocated_storage     = 10
  max_allocated_storage = 1000

  deletion_protection = false
  skip_final_snapshot = true

  tags = local.common_tags
}

resource "aws_db_subnet_group" "rds_subnet" {
  name       = "${var.org}-${var.env}-rds-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = local.common_tags
}