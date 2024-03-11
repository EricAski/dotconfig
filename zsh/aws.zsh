# If instance name is passed we use return information for current ec2 instance
# usage: ec2_describe
# or: ec2_describe my_ec2_name-gpu
function ec2_describe {
    instance_id=''
    if [ "$1" ]; then
        instance_id=$(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --filters 'Name=tag:Name,Values='"$1"'' --output text)
    else
        instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id) 
    fi
    instance_name=$(aws ec2 describe-tags --filters 'Name=resource-id,Values='"$instance_id"'' "Name=key,Values=Name" --output text | cut -f5)
    instance_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    instance_status=$(aws ec2 describe-instances --instance-ids $instance_id --query "Reservations[*].Instances[*].State.Name" --output text)
    echo "Instance id: "$instance_id
    echo "Instance ip: "$instance_ip
    echo "Instance name: "$instance_name
    echo "Instante state:" $instance_status
}

function ec2_login {
    instance_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values='"$1"'' --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    echo "Instance ip: " $instance_ip
    echo ssh -i ~/.ssh/eric.pem -L $2"8888:127.0.0.1:8888" ubuntu@$instance_ip 
    ssh -i ~/.ssh/eric.pem -L $2"8888:127.0.0.1:8888" ubuntu@$instance_ip
}

function ec2_stop {
    aws ec2 stop-instances --instance-ids $(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --filters 'Name=tag:Name,Values='"$1"'' --output text)
}
function ec2_start {
    aws ec2 start-instances --instance-ids $(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --filters 'Name=tag:Name,Values='"$1"'' --output text)
}

function ec2_scp {
    instance_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values='"$1"'' --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    scp -i ~/.ssh/eric.pem -r $2 ubuntu@$instance_ip:$3
}

