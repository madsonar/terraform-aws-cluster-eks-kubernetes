resource "aws_subnet" "subnet_main_dc_b" {
  vpc_id                  = var.vpc_main_dc
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zone_b 
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-main-dc-b"
  }
}

resource "aws_eks_cluster" "this" {
    name     = var.cluster_name_dc
    role_arn = aws_iam_role.eks_cluster.arn
    vpc_config {
      subnet_ids = [var.subnet_id_dc_a, aws_subnet.subnet_main_dc_b.id]
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks_cluster,
    ]
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks_cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "node-group-dc"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = [var.subnet_id_dc_a]
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  instance_types = ["t3.micro"]
}

resource "aws_iam_role" "eks_node" {
  name = "eks_node_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node.name
}

resource "aws_iam_role_policy_attachment" "eks_node_ecr_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node.name
}