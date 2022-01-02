

# AWS Regions
- costs and even functionality of services and features might
vary between regions.


# EC2 - Instance Types
General purpose A1, T3, T3a, T2, M6g, M5, M5a, M5n, M4
Compute optimized C5, C5n, C4
Memory optimized R5, R5a, R5n, X1e, X1, High Memory, z1d
Accelerated computing P3, P2, Inf1, G4, G3, F1
Storage optimized I3, I3en, D2, H1


T2s are burstable, which means you can accumulate CPU credits when your
instance is underutilized that can be applied during high-demand periods in
the form of higher CPU performance.
* Find out more about this

- Decide on:
Type/Region/VPC/Tenancy/Security Groups/SSH Keys/Resource Tags


curl http://169.254.169.254/latest/meta-data/
curl http://169.254.169.254/latest/meta-data/security-groups launch-wizard-1


# Security Groups
- They are the Firewall of your EC2 instances
- By default, a security group will deny all incoming traffic while permitting all outgoing traffic.



# EBS - Elastic Block Storage
- Per Instance storage
- Can attach as many as you like
- Usually created when you create EC2 instance
- You need to decide on size and type (HDD, SSD)
- Can take snapshots or create AMIs
