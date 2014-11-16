set :stage, :production

server '54.173.62.80', user: 'deploy', roles: %w{web app}
ssh_options[:keys] = ["/opt/media/src/rails/aws/kmorning-key-pair.pem"]
