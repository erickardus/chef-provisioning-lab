require 'chef/provisioning'
with_driver 'aws'


#Build machines dynamically, in serial mode

with_machine_options({
                     ssh_username: 'ec2-user',
                     bootstrap_options: {
                       key_name: 'provisioning_lab',
                       image_id: 'ami-60b6c60a',
                       instance_type: 't2.micro',
                     },
})


num_webservers = 2

1.upto(num_webservers) do |i|
    machine "web#{i}" do
        recipe 'apache'
    end
end
